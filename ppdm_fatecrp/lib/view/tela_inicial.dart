// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/card_itens.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    //     List<Widget> _telas = [
    //   Inicio(_pesquisa),
    //   EmAlta(),
    //   Inscricoes(),
    //   Biblioteca(),
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          "Página inicial",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(color: Color(0xffEFEFEF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seja bem vindo(a)!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Aqui você encontra as\nprincipais ferramentas do\naplicativo.",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Image.asset(
                  '../lib/assets/images/home_image.png',
                  width: 156,
                  height: 156,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, bottom: 16),
            child: Text(
              "Principais opções",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 2),
            ),
          ),
          Wrap(
            children: [
              CardItens('Alunos', Icons.person),
              CardItens('Turmas', Icons.group),
              CardItens('Add Aluno', Icons.person_add),
              CardItens('Add Turma', Icons.group_add),
              CardItens('Exportar', Icons.cloud_upload),
              CardItens('Sobre', Icons.info_outline),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (index) {
            setState(() {
              _indiceAtual = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffD9D9D9),
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Alunos', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'Turmas', icon: Icon(Icons.group)),
            BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu))
          ]),
    );
  }
}
