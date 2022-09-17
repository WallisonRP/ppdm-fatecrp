// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/botao_full_width.dart';
import '../model/caixa_de_texto.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(32, 80, 32, 32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Faça seu cadastro para começar a utilizar nosso aplicativo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
            ),
            CaixaDeTexto('Nome', Icons.person, 26),
            SizedBox(
              height: 16,
            ),
            CaixaDeTexto('Sobrenome', Icons.person, 26),
            SizedBox(
              height: 16,
            ),
            CaixaDeTexto('E-mail', Icons.email, 24),
            SizedBox(
              height: 16,
            ),
            CaixaDeTexto('Senha', Icons.lock, 25),
            SizedBox(
              height: 80,
            ),
            BotaoFullWidth('Cadastrar'),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 194, 194, 194),
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Voltar',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
