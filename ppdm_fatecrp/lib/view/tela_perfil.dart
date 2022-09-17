// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../model/caixa_de_texto_redonda.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              width: double.infinity,
              color: Color(0xffD9D9D9),
              child: Column(
                children: [
                  Image.asset('../lib/assets/images/profile.png'),
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Editar Perfil',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: CaixaDeTextoRedonda('Nome'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('Sobrenome'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('Data de Nascimento'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('Telefone'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('E-mail'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('RA'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CaixaDeTextoRedonda('Período'),
            ),
          ],
        ));
  }
}
