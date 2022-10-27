// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../widgets/caixa_de_texto_redonda.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  @override
  Widget build(BuildContext context) {
    Map pessoa = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          title: Text(
            'Perfil',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffD9D9D9),
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
                    Image.asset('lib/assets/images/profile.png'),
                    SizedBox(height: 16)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: CaixaDeTextoRedonda(pessoa['nome']),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda(pessoa['sobrenome']),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda('01/01/2001'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda('(16) 98765-4321'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda('fatec@fatec.sp.gov.br'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda('204048484848'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: CaixaDeTextoRedonda('Diurno'),
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
