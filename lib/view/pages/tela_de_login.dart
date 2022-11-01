// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../controller/firebase/auth.dart';
import '../widgets/botao_full_width.dart';
import '../widgets/caixa_de_texto.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({super.key});

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(32.0, 80.0, 32.0, 32.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Seja bem vindo(a)!",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 80.0),
                child: Text(
                  "Faça seu login para ter acesso ao aplicativo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              CaixaDeTexto('E-mail', Icons.email, 24.0, email),
              Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: TextField(
                    controller: senha,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    // cursorHeight: 25,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Senha',
                      
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 24.0,
                        color: Colors.black,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  )

                  // CaixaDeTexto('Senha', Icons.lock, 24.0, senha),
                  ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Esqueceu seu senha ?",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 15, 49, 241)),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController().login(
                        email: email.text, senha: senha.text, context: context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 194, 194, 194),
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Entrar',
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
              Text(
                'Novo(a) por aqui? Cadastre-se abaixo',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 16.0,
              ),
              BotaoFullWidth('Cadastrar', context, 'cadastro'),
            ],
          ),
        ),
      ),
    );
  }
}
