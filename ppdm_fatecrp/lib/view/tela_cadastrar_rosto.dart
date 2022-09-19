import 'package:flutter/material.dart';

import 'menu_view/tela_alunos.dart';

class TelaCadastrarRosto extends StatefulWidget {
  const TelaCadastrarRosto({super.key});

  @override
  State<TelaCadastrarRosto> createState() => _TelaCadastrarRostoState();
}

class _TelaCadastrarRostoState extends State<TelaCadastrarRosto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar aluno'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 30, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cadastrar rosto',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              '../lib/assets/images/profile2.png',
              width: 500,
              height: 250,
            ),
            Image.asset('../lib/assets/images/progress_bar.png'),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('telaInicial'));
                  },
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
      ),
    );
  }
}
