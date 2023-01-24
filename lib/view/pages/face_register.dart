import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:ppdm_fatecrp/services/face_detector_service.dart';
import 'package:ppdm_fatecrp/services/ml_service.dart';
import 'package:ppdm_fatecrp/services_locator.dart';
import 'package:ppdm_fatecrp/view/widgets/auth-action-button.dart';
import 'package:ppdm_fatecrp/view/widgets/camera_header.dart';
import 'package:ppdm_fatecrp/view/widgets/face_painter.dart';

class FaceRegister extends StatefulWidget {
  const FaceRegister({super.key});

  @override
  State<FaceRegister> createState() => _FaceRegisterState();
}

class _FaceRegisterState extends State<FaceRegister> {
  String? imagePath;
  Face? faceDetected;
  Size? imageSize;

  bool _detectingFaces = false;
  bool pictureTaken = false;

  bool _initializing = false;

  bool _saving = false;
  bool _bottomSheetVisible = false;

  Map<String, dynamic> aluno = {
    "nome": "",
    "dataNascimento": "",
    "email": "",
    "ra": "",
    "curso": "",
    "turma": "",
    "periodo": "",
    "model_data": ""
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

  Map<String, dynamic> get getStudent => aluno;

  // service injection
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  MLService _mlService = locator<MLService>();

  _start() async {
    await _cameraService.initialize();
    setState(() => _initializing = true);
    await Future.delayed(Duration(milliseconds: 1100));
    setState(() => _initializing = false);

    _frameFaces();
  }

  Future<bool> onShot() async {
    if (faceDetected == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Face não detectada'),
          );
        },
      );

      return false;
    } else {
      _saving = true;
      await Future.delayed(Duration(milliseconds: 500));
      // await _cameraService.cameraController?.stopImageStream();
      await Future.delayed(Duration(milliseconds: 200));
      XFile? file = await _cameraService.takePicture();
      imagePath = file?.path;

      setState(() {
        _bottomSheetVisible = true;
        pictureTaken = true;
      });

      return true;
    }
  }

  _frameFaces() {
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController?.startImageStream((image) async {
      if (_cameraService.cameraController != null) {
        if (_detectingFaces) return;

        _detectingFaces = true;

        try {
          await _faceDetectorService.detectFacesFromImage(image);

          if (_faceDetectorService.faces.isNotEmpty) {
            setState(() {
              faceDetected = _faceDetectorService.faces[0];
            });
            if (_saving) {
              _mlService.setCurrentPrediction(image, faceDetected);
              setState(() {
                _saving = false;
              });
            }
          } else {
            setState(() {
              faceDetected = null;
            });
          }

          _detectingFaces = false;
        } catch (e) {
          print(e);
          _detectingFaces = false;
        }
      }
    });
  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  _reload() {
    setState(() {
      _bottomSheetVisible = false;
      pictureTaken = false;
    });
    _start();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    late Widget body;

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

    if (_initializing) {
      body = Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_initializing && pictureTaken) {
      body = Container(
        width: width,
        height: height,
        child: Transform(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.file(File(imagePath!)),
            ),
            transform: Matrix4.rotationY(mirror)),
      );
    }

    if (!_initializing && !pictureTaken) {
      body = Transform.scale(
        scale: 1.0,
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: width,
                height:
                    width * _cameraService.cameraController!.value.aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CameraPreview(_cameraService.cameraController!),
                    CustomPaint(
                      painter: FacePainter(
                          face: faceDetected, imageSize: imageSize!),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: Stack(
          children: [
            body,
            CameraHeader(
              "Olhe para a câmera",
              onBackPressed: _onBackPressed,
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !_bottomSheetVisible
            ? AuthActionButton(
                onPressed: onShot,
                isAttendance: false,
                reload: _reload,
                aluno: aluno,
              )
            : Container());
  }
}
