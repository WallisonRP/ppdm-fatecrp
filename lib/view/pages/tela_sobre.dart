// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/card_itens.dart';
import '../../model/participantes.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({super.key});

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          'Sobre',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações do projeto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
                child: Text(
                    'Aplicativo criado para a disciplina de "Programação para dispositivos móveis" da FATEC de Ribeirão Preto - SP. Com o intuito de controlar a frequência dos alunos do 4º Semestre do curso de Análise e Desenvolvimento de Sistemas.')),
            SizedBox(
              height: 35,
            ),
            Text('Desenvolvedores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Pessoa(
              nome: 'Rodrigo de Oliveira Plotze',
              funcao: 'Professor orientador',
              foto: 'rodrigo',
              email: 'rodrigo.plotze',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Gabriel Afonso Pinho de Oliveira',
              funcao: 'Desenvolvedor',
              foto: 'gabriel',
              email: 'gabriel.oliveira237',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Wallison Franklin Pereira',
              funcao: 'Desenvolvedor',
              foto: 'wallison',
              email: 'wallison.pereira',
            ),
            
          ],
        ),
      ),
    );
  }
}
