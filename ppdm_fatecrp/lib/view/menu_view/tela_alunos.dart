// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class TelaAlunos extends StatefulWidget {
  const TelaAlunos({super.key});

  @override
  State<TelaAlunos> createState() => _TelaAlunosState();
}

class _TelaAlunosState extends State<TelaAlunos> {
  List lista = [
    'Camila Silva',
    'Ciro Abib',
    'Fabio Chubinho',
    'Gabriel Oliveira',
    'Guilherme Crisóstopo',
    'Guilherme Lima Beta',
    'Gustavo Latrocínio',
    'Gustavo Macrino',
    'Juliano Henrico',
    'Maria Duda',
    'Pedro Brilhadori',
    'Raul Benado',
    'Wallison Pereira'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          // 'Página inicial',
          'Alunos',
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
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    minVerticalPadding: 20,
                    title: Text(lista[index]),
                    subtitle: Text('(16) 98765-4321'),
                    leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffD9D9D9)),
                      width: 60,
                      height: 70,
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
