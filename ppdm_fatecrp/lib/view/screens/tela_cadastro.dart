// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../model/botao_full_width.dart';
import '../../model/caixa_de_texto.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(32.0, 80.0, 32.0, 32.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Faça seu cadastro para começar a utilizar nosso aplicativo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80.0,
              ),
              CaixaDeTexto('Nome', Icons.person, 26.0),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('Sobrenome', Icons.person, 26.0),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('E-mail', Icons.email, 24.0),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('Senha', Icons.lock, 25.0),
              SizedBox(
                height: 80.0,
              ),
              BotaoFullWidth('Cadastrar', context, 'telaInicial'),
              SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 194, 194, 194),
                    padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 8.0),
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
      ),
    );
  }
}
