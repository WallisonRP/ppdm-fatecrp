// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/botao_full_width.dart';
import '../../model/caixa_de_texto.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({super.key});

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(32, 80, 32, 32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Seja bem vindo(a)!",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 80),
              child: Text(
                "Faça seu login para ter acesso ao aplicativo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            CaixaDeTexto('E-mail', Icons.email, 24),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: CaixaDeTexto('Senha', Icons.lock, 24),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Esqueceu seu senha ?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 49, 241)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BotaoFullWidth('Entrar', context, 'telaInicial'),
            SizedBox(
              height: 60,
            ),
            Text(
              'Novo(a) por aqui? Cadastre-se abaixo',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            BotaoFullWidth('Cadastrar', context, 'cadastro'),
          ],
        ),
      ),
    );
  }
}
