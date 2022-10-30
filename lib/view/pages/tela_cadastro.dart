// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../controller/firebase/auth.dart';
import '../widgets/botao_full_width.dart';
import '../widgets/caixa_de_texto.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController sobrenome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Realizar Cadastro')),
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
              CaixaDeTexto('Nome', Icons.person, 26.0, nome),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('Sobrenome', Icons.person, 26.0, sobrenome),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('E-mail', Icons.email, 24.0, email),
              SizedBox(
                height: 16.0,
              ),
              CaixaDeTexto('Senha', Icons.lock, 25.0, senha),
              SizedBox(
                height: 80.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController().criarConta(
                        email: email.text,
                        senha: senha.text,
                        context: context,
                        nome: nome.text,
                        sobrenome: sobrenome.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 194, 194, 194),
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
