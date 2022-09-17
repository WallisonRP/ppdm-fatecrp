import 'package:flutter/material.dart';

import '../model/caixa_de_texto_redonda.dart';

class TelaCadastrarAluno extends StatefulWidget {
  const TelaCadastrarAluno({super.key});

  @override
  State<TelaCadastrarAluno> createState() => _TelaCadastrarAlunoState();
}

class _TelaCadastrarAlunoState extends State<TelaCadastrarAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Perfil',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffD9D9D9),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'Dados pessoais',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
              CaixaDeTextoRedonda('Nome'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Sobrenome'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Data de Nascimento'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Telefone'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('E-mail'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('RA'),
              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD9D9D9),
                      padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Proximo',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD9D9D9),
                      padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
