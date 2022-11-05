// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/custom_search_delegate.dart';
import '../../controller/firebase/firestore.dart';
import '../../model/aluno.dart';

class TelaAlunosPorTurma extends StatefulWidget {
  const TelaAlunosPorTurma({super.key});

  @override
  State<TelaAlunosPorTurma> createState() => _TelaAlunosPorTurmaState();
}

class _TelaAlunosPorTurmaState extends State<TelaAlunosPorTurma> {
  final db = FirebaseFirestore.instance;

  atribuirDadosAluno(String nome, String dataNascimento, String email,
      String ra, String curso, String turma, String periodo) {
    Map<String, dynamic> aluno = {};
    aluno['nome'] = nome;
    aluno['dataNascimento'] = dataNascimento;
    aluno['email'] = email;
    aluno['ra'] = ra;
    aluno['curso'] = curso;
    aluno['turma'] = turma;
    aluno['periodo'] = periodo;

    return aluno;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map retorno = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;
    var listaAlunos = db
        .collection('alunos')
        .doc('cursos')
        .collection('ads')
        .doc(retorno['turma'])
        .collection('alunos')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black, opacity: 1),
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          // 'Página inicial',
          'Alunos',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? result = await showSearch(
                    context: context, delegate: CustomSearchDelegate(''));
                // setState(() {
                //   _pesquisa = result;
                // });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 224, 224, 224)),
              ),
            ),
            child: Row(
              children: [
                Text("Ordem alfabética"),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: listaAlunos,
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> querySnapshot) {
                if (querySnapshot.hasError) {
                  return Text("Erro ao recuperar dados");
                }
                if (querySnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final list = querySnapshot.data!.docs;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Aluno(list[index]),
                        onTap: () {
                          Navigator.pushNamed(context, 'verPerfil', arguments: {
                            "nome": list[index]['nome'],
                            "dataNascimento": list[index]['dataNascimento'],
                            "email": list[index]['email'],
                            "ra": list[index]['ra'],
                            "curso": list[index]['curso'],
                            "turma": list[index]['turma'],
                            "periodo": list[index]['periodo']
                          });
                        },
                      );
                    },
                    itemCount: list.length,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                }
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'cadastrarAluno');
        },
      ),
    );
  }
}
