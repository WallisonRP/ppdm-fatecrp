// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/card_itens.dart';

// import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:ppdm_fatecrp/services/face_detector_service.dart';
import 'package:ppdm_fatecrp/services/ml_service.dart';
import 'package:ppdm_fatecrp/services_locator.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  // CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  _initializeServices() async {
    setState(() => loading = true);
    // await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          // 'Página inicial',
          'Página inicial',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(color: Color(0xffEFEFEF), boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seja bem vindo(a)!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Aqui você encontra as principais ferramentas do aplicativo.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/home_image.png',
                    width: 150,
                    height: 150,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, bottom: 8),
            child: Text(
              "Principais opções",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 2),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                padding: EdgeInsets.all(16),
                childAspectRatio: (100 / 74),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  GestureDetector(
                      child: CardItens('Novo Aluno', Icons.person_add, context),
                      onTap: () {
                        Navigator.pushNamed(context, 'cadastrarAluno');
                      }),
                  GestureDetector(
                      child: CardItens('Registrar', Icons.search, context),
                      onTap: () {
                        // _initializeServices();

                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Atenção!'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Você está entrando no modo de chamada'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('cancelar')),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(16)),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, 'registrar');
                                      },
                                      child: Text("Confirmar")),
                                ],
                              );
                            });
                      }),
                  GestureDetector(
                      child: CardItens('Nova Turma', Icons.group_add, context),
                      onTap: () {
                        Navigator.pushNamed(context, 'cadastrarTurma');
                      }),
                  GestureDetector(
                      child: CardItens('Exportar', Icons.cloud_upload, context),
                      onTap: () {}),
                  GestureDetector(
                      child: CardItens('Sobre', Icons.info_outline, context),
                      onTap: () {
                        Navigator.pushNamed(context, 'sobre');
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*

                  // GestureDetector(
                  //   child: CardItens('Alunos', Icons.person),
                  //   onTap: () {
                  //     Navigator.pushNamed(context, 'telaAlunos');
                  //   },
                  // ),
                  // GestureDetector(
                  //     child: CardItens('Turmas', Icons.group),
                  //     onTap: () {
                  //       Navigator.pushNamed(context, 'telaTurmas');
                  //     }),

                  
Wrap(
            children: [
              // GestureDetector(
              //   child: CardItens('Alunos', Icons.person),
              //   onTap: () {
              //     Navigator.pushNamed(context, 'telaAlunos');
              //   },
              // ),
              // GestureDetector(
              //     child: CardItens('Turmas', Icons.group),
              //     onTap: () {
              //       Navigator.pushNamed(context, 'telaTurmas');
              //     }),
              GestureDetector(
                  child: CardItens('Add Aluno', Icons.person_add, context),
                  onTap: () {
                    Navigator.pushNamed(context, 'cadastrarAluno');
                  }),
              GestureDetector(
                  child: CardItens('Add Turma', Icons.group_add, context),
                  onTap: () {
                    Navigator.pushNamed(context, 'cadastrarTurma');
                  }),
              GestureDetector(
                  child: CardItens('Exportar', Icons.cloud_upload, context),
                  onTap: () {}),
              GestureDetector(
                  child: CardItens('Sobre', Icons.info_outline, context),
                  onTap: () {
                    Navigator.pushNamed(context, 'sobre');
                  }),
            ],
          )
*/