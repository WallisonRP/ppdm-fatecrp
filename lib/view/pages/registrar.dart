import 'dart:async';
import 'package:ppdm_fatecrp/services_locator.dart';
import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:ppdm_fatecrp/view/widgets/auth_button.dart';
import 'package:ppdm_fatecrp/view/widgets/camera_detection_preview.dart';
import 'package:ppdm_fatecrp/view/widgets/camera_header.dart';
import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:ppdm_fatecrp/services/ml_service.dart';
import 'package:ppdm_fatecrp/services/face_detector_service.dart';
import 'package:ppdm_fatecrp/view/widgets/signin_form.dart';
import 'package:ppdm_fatecrp/view/widgets/single_picture.dart';

// import 'package:intl/intl.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Registrar extends StatefulWidget {
  const Registrar({Key? key}) : super(key: key);

  @override
  RegistrarState createState() => RegistrarState();
}

class RegistrarState extends State<Registrar> {
  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _faceDetectorService =
      locator<FaceDetectorService>();
  final MLService _mlService = locator<MLService>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isPictureTaken = false;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _mlService.dispose();
    _faceDetectorService.dispose();
    super.dispose();
  }

  Future _start() async {
    setState(() => _isInitializing = true);
    await _cameraService.initialize();
    // CameraService().clearImagePath();
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() => _isInitializing = false);
    _frameFaces();
  }

  _frameFaces() async {
    bool processing = false;
    _cameraService.cameraController!
        .startImageStream((CameraImage image) async {
      if (processing) return; // previne superprocessamento desnecessário
      processing = true;
      await _predictFacesFromImage(image: image);
      processing = false;
    });
  }

  Future<void> _predictFacesFromImage({@required CameraImage? image}) async {
    assert(image != null, 'A imagem é nula!');
    await _faceDetectorService.detectFacesFromImage(image!);
    if (_faceDetectorService.faceDetected) {
      _mlService.setCurrentPrediction(image, _faceDetectorService.faces[0]);
    }
    if (mounted) setState(() {});
  }

  Future<void> takePicture() async {
    if (_faceDetectorService.faceDetected) {
      await _cameraService.takePicture();
      setState(() => _isPictureTaken = true);
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text('Rosto não detectado!')));
    }
  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  _reload() {
    if (mounted) setState(() => _isPictureTaken = false);
    _start();
  }

  Future<void> onTap(String materia) async {
    await takePicture();
    if (_faceDetectorService.faceDetected) {
      Student? student = await _mlService.predict();
      var bottomSheetController = scaffoldKey.currentState!.showBottomSheet(
          (context) => signInSheet(student: student, materia: materia));
      bottomSheetController.closed.whenComplete(_reload);
    }
  }

  Widget getBodyWidget() {
    if (_isInitializing) return Center(child: CircularProgressIndicator());
    if (_isPictureTaken)
      return SinglePicture(imagePath: _cameraService.imagePath!);
    return CameraDetectionPreview();
  }

  @override
  Widget build(BuildContext context) {
    Map turma = ModalRoute.of(context)!.settings.arguments as Map;
    String materia = 'LIN500';
    Widget header = CameraHeader("Chamada", onBackPressed: _onBackPressed);
    Widget body = getBodyWidget();
    Widget? fab;

    if (!_isPictureTaken)
      fab = AuthButton(
        onTap: () {
          onTap(materia);
        },
      );

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [body, header],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: fab,
    );
  }

  signInSheet({@required Student? student, required String materia}) =>
      student == null
          ? Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text(
                'Aluno não encontrado 😞',
                style: TextStyle(fontSize: 20),
              ),
            )
          : SignInSheet(
              student: student,
              materia: materia,
            );
}
