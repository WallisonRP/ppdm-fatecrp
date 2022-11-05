// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../widgets/caixa_de_texto_redonda.dart';


class EditarPerfilAluno extends StatefulWidget {
  const EditarPerfilAluno({super.key});

  @override
  State<EditarPerfilAluno> createState() => _EditarPerfilAlunoState();
}

class _EditarPerfilAlunoState extends State<EditarPerfilAluno> {
    TextEditingController _nome = TextEditingController();
  TextEditingController _sobrenome = TextEditingController();
  TextEditingController _dataNascimento = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _ra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
          ),
        title: Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    'Dados pessoais',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                CaixaDeTextoRedonda(label: 'Nome', controller: _nome, leitura: false),
                SizedBox(height: 16),
                CaixaDeTextoRedonda(label: 'Sobrenome', controller: _sobrenome, leitura: false),
                SizedBox(height: 16),
                CaixaDeTextoRedonda(label: 'Data de Nascimento', controller: _dataNascimento, leitura: false),
                SizedBox(height: 16),
                CaixaDeTextoRedonda(label: 'E-mail', controller: _email, leitura: false),
                SizedBox(height: 16),
                CaixaDeTextoRedonda(label: 'RA', controller: _ra, leitura: false),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Voltar',
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
                        'Salvar',
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
          ),
        ),
    );
  }
}