import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppdm_fatecrp/controller/db/db_controller.dart';
import 'package:ppdm_fatecrp/controller/firebase/firestore.dart';
import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:ppdm_fatecrp/services/ml_service.dart';
import 'package:ppdm_fatecrp/services_locator.dart';
import 'package:ppdm_fatecrp/view/widgets/button_icon.dart';

// import 'package:ppdm_fatecrp/view/pages/face_register.dart';

import 'package:flutter/material.dart';

class AuthActionButton extends StatefulWidget {
  AuthActionButton(
      {Key? key,
      this.aluno,
      required this.onPressed,
      required this.isAttendance,
      required this.reload});
  final Function onPressed;
  final bool isAttendance;
  final Function reload;
  var aluno;

  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  final MLService _mlService = locator<MLService>();
  final CameraService _cameraService = locator<CameraService>();

  Student? predictedStudent;

  Future _register(context) async {
    DatabaseHelper _databaseHelper = DatabaseHelper.instance;
    List predictedData = _mlService.predictedData;
    String nome = widget.aluno["nome"];
    String ra = widget.aluno["ra"];
    widget.aluno["model_data"] = predictedData;
    Student studentToSave = Student(
      name: nome,
      ra: ra,
      modelData: predictedData,
    );

    await _databaseHelper.insert(studentToSave);
    _mlService.setPredictedData([]);

    await Firestore().saveStudentInFirebase(widget.aluno);
    _cameraService.dispose();
    Navigator.pushReplacementNamed(context, 'checkout');
  }

  Future attendance(context) async {
    Navigator.pushReplacementNamed(context, 'checkout');
  }

  Future<Student?> _predictStudent() async {
    Student? student = await _mlService.predict();
    return student;
  }

  Future onTap() async {
    try {
      bool faceDetected = await widget.onPressed();
      if (faceDetected) {
        if (widget.isAttendance) {
          print('loginnnn');
          var student = await _predictStudent();
          if (student != null) {
            predictedStudent = student;
          }
        }
        PersistentBottomSheetController bottomSheetController =
            Scaffold.of(context)
                .showBottomSheet((context) => signSheet(context));

        bottomSheetController.closed.whenComplete(() => widget.reload());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registrar',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isAttendance && predictedStudent != null
              ? Container(
                  child: Text(
                    predictedStudent!.name + ' sua presença foi contabilizada',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : widget.isAttendance
                  ? Container(
                      child: Text(
                      'Aluno não encontrado 😞',
                      style: TextStyle(fontSize: 20),
                    ))
                  : Container(),
          Container(
            child: Column(
              children: [
                !widget.isAttendance
                    ? Text("Roto capturado com sucesso!!")
                    : Container(),
                SizedBox(height: 10),
                widget.isAttendance && predictedStudent != null
                    ? ButtonIcon(
                        text: 'Registrar Presença',
                        onPressed: () async {
                          attendance(context);
                        },
                        icon: Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      )
                    : !widget.isAttendance
                        ? ButtonIcon(
                            text: 'FINALIZAR',
                            onPressed: () async {
                              await _register(context);
                            },
                            icon: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
