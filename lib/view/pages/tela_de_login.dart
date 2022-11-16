// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../controller/firebase/auth.dart';
import '../widgets/botao_full_width.dart';
import '../widgets/caixa_de_texto.dart';
import '../widgets/util.dart';

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
          margin: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/login.png',
                width: 500,
                height: 230,
              ),
              Text(
                "Seja bem vindo(a)!",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 50.0),
                child: Text(
                  "Faça seu login para ter acesso ao aplicativo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              CaixaDeTexto('E-mail', Icons.email, 24.0, email),
              Padding(
                  padding: EdgeInsets.only(top: 26.0, bottom: 16.0),
                  child: TextField(
                    controller: senha,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                child: TextButton(
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Informe seu e-mail',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blueGrey.shade700,
                            ),
                          ),
                          titlePadding: EdgeInsets.all(20),
                          content: Container(
                            width: 350,
                            height: 80,
                            child: Column(
                              children: [
                                campoTexto('E-mail', Icons.email, email),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.blueGrey.shade50,
                          actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size(120, 50),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'cancelar',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueAccent.shade700,
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent.shade700,
                                minimumSize: Size(120, 50),
                              ),
                              onPressed: () async {
                                if (email.text.isNotEmpty) {
                                  LoginController()
                                      .esqueceuSenha(email.text);
                                  sucesso(
                                      context, 'E-mail enviado com sucesso.');
                                } else {
                                  erro(context,
                                      'Informe o e-mail para recuperar a senha.');
                                }

                                Navigator.pop(context);
                                email.clear();
                              },
                              child: Text(
                                'enviar',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
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
