// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../model/card_itens.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
          ),
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          // 'Página inicial',
          'Página inicial',
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
                      "Aqui você encontra as principais\nferramentas do aplicativo.",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Image.asset(
                  'lib/assets/images/home_image.png',
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
              // GestureDetector(
              //   child: CardItens('Alunos', Icons.person),
              //   onTap: () {
              //     Navigator.pushNamed(context, 'telaAlunos');
              //   },
              // ),
              // GestureDetector(
              //     child: CardItens('Turmas', Icons.group),
              //     onTap: () {
              //       Navigator.pushNamed(context, 'telaTurmas');
              //     }),
              GestureDetector(
                  child: CardItens('Add Aluno', Icons.person_add),
                  onTap: () {
                    Navigator.pushNamed(context, 'cadastrarAluno');
                  }),
              GestureDetector(
                  child: CardItens('Add Turma', Icons.group_add),
                  onTap: () {
                    Navigator.pushNamed(context, 'cadastrarTurma');
                  }),
              GestureDetector(
                  child: CardItens('Exportar', Icons.cloud_upload),
                  onTap: () {}),
              GestureDetector(
                  child: CardItens('Sobre', Icons.info_outline),
                  onTap: () {
                    Navigator.pushNamed(context, 'sobre');
                  }),
            ],
          )
        ],
      ),
    );
  }
}
