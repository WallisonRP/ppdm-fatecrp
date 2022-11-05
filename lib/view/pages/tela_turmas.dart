// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaTurmas extends StatefulWidget {
  const TelaTurmas({super.key});

  @override
  State<TelaTurmas> createState() => _TelaTurmasState();
}

class _TelaTurmasState extends State<TelaTurmas> {
  List cursos = [
    'Análise e Desenvolvimento de Sistemas',
    'Gestão de Negócios e Inovação',
    'Sistemas Biomédicos'
  ];

  List lista = [
    '1° Semestre',
    '2° Semestre',
    '3° Semestre',
    '4° Semestre',
    '5° Semestre',
    '6° Semestre'
  ];

  final db = FirebaseFirestore.instance;

  exibirTurma(texto) {
    String alo = '';
    if (texto == '1semestre') {
      alo = lista[0];
    } else if (texto == '2semestre') {
      alo = lista[1];
    } else if (texto == '3semestre') {
      alo = lista[2];
    } else if (texto == '4semestre') {
      alo = lista[3];
    } else if (texto == '5semestre') {
      alo = lista[4];
    } else if (texto == '6semestre') {
      alo = lista[5];
    }

    return alo;
  }

  @override
  Widget build(BuildContext context) {
    Map retorno = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;
    var listaTurmas = db
        .collection('alunos')
        .doc('cursos')
        .collection(retorno['curso'])
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          // 'Página inicial',
          'Turmas',
          style: TextStyle(color: Colors.black),
        ),
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
              stream: listaTurmas,
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
                      return Container(
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, 'telaAlunosPorTurmas',
                                arguments: {"turma": list[index].id});
                          },
                          minVerticalPadding: 30,
                          title: Text(
                            exibirTurma(list[index].id),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 28,
                              )
                            ],
                          ),
                        ),
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
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // Navigator.pushNamed(context, 'cadastrarTurma');
      //     print(retorno['curso']);
      //   },
      // ),
    );
  }
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
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    minVerticalPadding: 30,
                    title: Text(
                      lista[index],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 28,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 224, 224, 224)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )

 */