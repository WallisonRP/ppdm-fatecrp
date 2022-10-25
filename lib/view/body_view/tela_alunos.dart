// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../controller/custom_search_delegate.dart';
import '../../model/aluno.dart';

class TelaAlunos extends StatefulWidget {
  const TelaAlunos({super.key});

  @override
  State<TelaAlunos> createState() => _TelaAlunosState();
}

class _TelaAlunosState extends State<TelaAlunos> {
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

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: pessoas.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Aluno(pessoas[index]),
                  onTap: () {
                    Navigator.pushNamed(context, 'verPerfil',
                        arguments: pessoas[index]);
                  },
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
