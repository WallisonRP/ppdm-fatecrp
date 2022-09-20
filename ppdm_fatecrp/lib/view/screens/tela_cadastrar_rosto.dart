import 'package:flutter/material.dart';


class TelaCadastrarRosto extends StatefulWidget {
  const TelaCadastrarRosto({super.key});

  @override
  State<TelaCadastrarRosto> createState() => _TelaCadastrarRostoState();
}

class _TelaCadastrarRostoState extends State<TelaCadastrarRosto> {
  var snackBar = SnackBar(
    content: Text('Aluno cadastrado com sucesso!'),
    backgroundColor: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD9D9D9),
        iconTheme: IconThemeData(
            color: Colors.black
          ),
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
              'lib/assets/images/profile2.png',
              width: 500,
              height: 250,
            ),
            Image.asset('lib/assets/images/progress_bar.png'),
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
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('Adicionar Aluno'),
                            content: Text('Confirmar cadastro de aluno?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(16)),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.popUntil(context,
                                        ModalRoute.withName('telaInicial'));
                                  },
                                  child: Text("Confirmar"))
                            ],
                          );
                        });
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
