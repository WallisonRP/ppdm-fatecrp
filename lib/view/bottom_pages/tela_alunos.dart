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
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listaAlunos = db
        .collection('alunos')
        .doc('cursos')
        .collection('ads')
        .doc('4semestre')
        .collection('alunos')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white, opacity: 1),
        title: Text(
          // 'Página inicial',
          'Alunos',
          style: TextStyle(color: Colors.white),
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
