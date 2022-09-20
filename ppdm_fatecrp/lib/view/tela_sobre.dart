// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/card_itens.dart';

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
        iconTheme: IconThemeData(
            color: Colors.black
          ),
        title: Text('Sobre'),
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
                    'Aqui você encontra tudo sobre a equipe responsável por este projeto, Aqui você encontra tudo sobre a equipe responsável por este projeto ...Aqui você encontra tudo sobre a equipe responsável por este projeto ...Aqui você encontra tudo sobre a equipe responsável por este projeto ...Aqui você encontra tudo sobre a equipe responsável por este projeto ...Aqui você encontra tudo sobre a equipe responsável por este projeto ...Aqui você encontra tudo sobre a equipe responsável por este dsaa')),
            SizedBox(
              height: 35,
            ),
            Text('Desenvolvedores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 224, 224, 224)),
                  margin: EdgeInsets.only(right: 10),
                  width: 80,
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Rodrigo de Oliveira Plotze',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Orientador')
                  ],
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 224, 224, 224)),
                  margin: EdgeInsets.only(right: 10),
                  width: 80,
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gabriel Afonso Pinho de Oliveira',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Desenvolvedor')
                  ],
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 224, 224, 224)),
                  margin: EdgeInsets.only(right: 10),
                  width: 80,
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Wallison Franklin Pereira',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Desenvolvedor')
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
