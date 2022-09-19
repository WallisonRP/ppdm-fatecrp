// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaTurmas extends StatefulWidget {
  const TelaTurmas({super.key});

  @override
  State<TelaTurmas> createState() => _TelaTurmasState();
}

class _TelaTurmasState extends State<TelaTurmas> {
  List lista = [
    '1° Semestre',
    '2° Semestre',
    '3° Semestre',
    '4° Semestre',
    '5° Semestre',
    '6° Semestre'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'cadastrarTurma');
        },
      ),
    );
  }
}
