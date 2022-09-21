import 'package:flutter/material.dart';

import '../../model/caixa_de_texto_redonda.dart';

class TelaCadastrarTurma extends StatefulWidget {
  const TelaCadastrarTurma({super.key});

  @override
  State<TelaCadastrarTurma> createState() => _TelaCadastrarTurmaState();
}

class _TelaCadastrarTurmaState extends State<TelaCadastrarTurma> {
  var snackBar = SnackBar(
    content: Text('Turma cadastrada com sucesso!'),
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
        title: Text(
          'Cadastrar turma',
          style: TextStyle(color: Colors.black),
          ),
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
                  'Informações da turma',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
              CaixaDeTextoRedonda('Nome'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Tipo de grupo'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Representante(s)'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Limitar quantidade de membros'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('E-mail'),
              SizedBox(height: 16),
              CaixaDeTextoRedonda('Descrição'),
              SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Adicionar Turma'),
                              content: Text('Confirmar cadastro de turma?'),
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
                      'Criar',
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
