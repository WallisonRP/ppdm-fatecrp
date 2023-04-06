import 'package:intl/intl.dart';
import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:ppdm_fatecrp/services_locator.dart';
import 'package:ppdm_fatecrp/view/widgets/app_text_field.dart';
import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/widgets/button_icon.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.student, required this.materia}) : super(key: key);
  final Student student;
  final String materia;

  final _cameraService = locator<CameraService>();
  List studentsPresent = [];

  Future<Map> _getDate() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    var hour = new DateFormat.Hms().toString();
    Map dateAndHour = {
      "data": formatter.format(now).toString(),
      "hora": hour 
    };

    return dateAndHour;
  }

  Future _attendance(context, user) async {
    Navigator.pushReplacementNamed(context, 'telaInicial');
  }

  Future<void> _attendanceList({student}) async {
    Map dateAndHour = await _getDate();

    studentsPresent.add({
      "materia": materia,
      "nome_aluno": student.name,
      "data_chamada": dateAndHour['data'],
      "hora_chamada": dateAndHour['hora']
    });
    
    for (var i in studentsPresent) {
      print(i);
    }

    // print(student['nome']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              '${student.name} presença registrada',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                ButtonIcon(
                  text: 'Continuar chamada',
                  onPressed: () async {
                    await CameraService().clearImagePath();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.face,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                ButtonIcon(
                  text: 'Menu inicial',
                  onPressed: () async {
                    _attendance(context, student);
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
