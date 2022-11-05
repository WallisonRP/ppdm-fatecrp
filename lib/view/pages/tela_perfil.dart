// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/caixa_de_texto_redonda.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _dataNascimento = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _ra = TextEditingController();
  TextEditingController _periodo = TextEditingController();
  TextEditingController _curso = TextEditingController();
  TextEditingController _turma = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map pessoa = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    _nome.text = pessoa['nome'];
    _dataNascimento.text = pessoa['dataNascimento'];
    _email.text = pessoa['email'];
    _ra.text = pessoa['ra'];
    _curso.text = pessoa['curso'];
    _turma.text = pessoa['turma'];
    _periodo.text = pessoa['periodo'];

    if (_curso.text == 'ads') {
      _curso.text = 'Análise e Desenvolvimento de Sistemas';
    } else if (_curso.text == 'gni') {
      _curso.text = 'Gestão de Negócios e Inovação';
    } else if (_curso.text == 'sbm') {
      _curso.text = 'Sistemas Biomédicos';
    }

    if (_turma.text == '1semestre') {
      _turma.text = '1º Semestre';
    } else if (_turma.text == '2semestre') {
      _turma.text = '2º Semestre';
    } else if (_turma.text == '3semestre') {
      _turma.text = '3º Semestre';
    } else if (_turma.text == '4semestre') {
      _turma.text = '4º Semestre';
    } else if (_turma.text == '5semestre') {
      _turma.text = '5º Semestre';
    } else if (_turma.text == '6semestre') {
      _turma.text = '6º Semestre';
    }

    if (_periodo.text == 'manha') {
      _periodo.text = 'Manhã';
    } else if (_periodo.text == 'noite') {
      _periodo.text = 'Noite';
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Perfil',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                width: double.infinity,
                color: Color(0xffD9D9D9),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.blue,
                      child: Text(
                        pessoa['nome'][0],
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    // Image.asset('lib/assets/images/profile.png'),
                    SizedBox(height: 16)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Nome', controller: _nome, leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Data de Nascimento',
                    controller: _dataNascimento,
                    leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Email', controller: _email, leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'RA', controller: _ra, leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Curso', controller: _curso, leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Turma', controller: _turma, leitura: true),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(
                    label: 'Periodo', controller: _periodo, leitura: true),
              ),
            ],
          ),
        ));
  }
}


/*
OutlinedButton(
                      onPressed: () {
                        print(pessoa['nome']);
                      },
                      child: Text(
                        'Perfil',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    )
*/
