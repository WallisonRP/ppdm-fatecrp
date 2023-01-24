import 'package:flutter/material.dart';

// import 'package:ppdm_fatecrp/services/camera_service.dart';

class TelaCadastrarRosto extends StatefulWidget {
  const TelaCadastrarRosto({super.key});

  @override
  State<TelaCadastrarRosto> createState() => _TelaCadastrarRostoState();
}

class _TelaCadastrarRostoState extends State<TelaCadastrarRosto> {

  // _initializeServices() async {
  //   setState(() => loading = true);
  //   // await _cameraService.initialize();
  //   await _mlService.initialize();
  //   _mlKitService.initialize();
  //   setState(() => loading = false);
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _initializeServices();
  // }

  Map<String, dynamic> aluno = {
    "nome": "",
    "dataNascimento": "",
    "email": "",
    "ra": "",
    "curso": "",
    "turma": "",
    "periodo": ""
  };

  atribuirDadosAluno(String nome, String dataNascimento, String email,
      String ra, String curso, String turma, String periodo) {
    aluno['nome'] = nome;
    aluno['dataNascimento'] = dataNascimento;
    aluno['email'] = email;
    aluno['ra'] = ra;
    aluno['curso'] = curso;
    aluno['turma'] = turma;
    aluno['periodo'] = periodo;
  }

  @override
  Widget build(BuildContext context) {
    Map retorno = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;

    atribuirDadosAluno(
        retorno['nome'],
        retorno['dataNascimento'],
        retorno['email'],
        retorno['ra'],
        retorno['curso'],
        retorno['turma'],
        retorno['periodo']);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Cadastrar aluno',
          style: TextStyle(color: Colors.white),
        ),
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
              'assets/images/profile2.png',
              width: 500,
              height: 250,
            ),
            Image.asset('assets/images/progress_bar.png'),
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
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('Siga as instruções abaixo:'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('• Alinhe a camera ao seu rosto'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Verifique o enquadramento'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Alinhe a camera ao seu rosto'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Alinhe a camera ao seu rosto'),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(16)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'faceRegister',
                                        arguments: aluno);
                                    // Navigator.pushNamed(
                                    //     context, 'faceRegister');
                                  },
                                  child: Text("Confirmar"))
                            ],
                          );
                        });
                  },
                  child: Text(
                    'Proximo',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
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
