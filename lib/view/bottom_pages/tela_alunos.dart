// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/custom_search_delegate.dart';
import '../../controller/firebase/firestore.dart';
import '../../model/aluno.dart';

class TelaAlunos extends StatefulWidget {
  const TelaAlunos({super.key});

  @override
  State<TelaAlunos> createState() => _TelaAlunosState();
}

class _TelaAlunosState extends State<TelaAlunos> {
  // Map<String, dynamic> aluno = {
  //   "nome": "",
  //   "dataNascimento": "",
  //   "email": "",
  //   "ra": "",
  //   "curso": "",
  //   "turma": "",
  //   "periodo": ""
  // };

  List pessoas = [
    {'nome': 'Camila', 'sobrenome': 'Silva'},
    {'nome': 'Ciro', 'sobrenome': 'Abib'},
    {'nome': 'Fábio', 'sobrenome': 'Chubinho'},
    {'nome': 'Gabriel', 'sobrenome': 'Oliveira'},
    {'nome': 'Guilherme', 'sobrenome': 'Crisóstopo'},
    {'nome': 'Guilherme', 'sobrenome': 'Lima Beta'},
    {'nome': 'Gustavo', 'sobrenome': 'Latrocínio'},
    {'nome': 'Gustavo', 'sobrenome': 'Macrino'},
    {'nome': 'Juliano', 'sobrenome': 'Henrico'},
    {'nome': 'Maria', 'sobrenome': 'Duda'},
    {'nome': 'Pedro', 'sobrenome': 'Brilhadori'},
    {'nome': 'Raul', 'sobrenome': 'Benado'},
    {'nome': 'Wallison', 'sobrenome': 'Pereira'},
  ];

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

  List teste = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listaAlunos =
        db.collection('alunos').doc('ads').collection('4semestre').snapshots();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    context: context, delegate: CustomSearchDelegate(pessoas));
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

                  // print(teste1);

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

  /*
  Column(
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
          } else if (querySnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            final list = querySnapshot.data!.docs;

            return ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Aluno(list[index], context),
                  onTap: () {
                    Navigator.pushNamed(context, 'verPerfil',
                        arguments: list[index]);
                  },
                );
              },
              itemCount: list.length,
              separatorBuilder: (context, index) {
                // <-- SEE HERE
                return Divider();
              },
            );
          }
        }),
      ),
          )
        ],
      )


      return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index]['nome']),
                );
              },
              itemCount: list.length,
            );
   */
}
