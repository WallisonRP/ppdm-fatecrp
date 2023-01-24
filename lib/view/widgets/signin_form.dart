import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:ppdm_fatecrp/services_locator.dart';
import 'package:ppdm_fatecrp/view/widgets/app_text_field.dart';
import 'package:ppdm_fatecrp/services/camera_service.dart';
import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/widgets/button_icon.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.student}) : super(key: key);
  final Student student;

  final _cameraService = locator<CameraService>();

  Future _attendance(context, user) async {
    Navigator.pushReplacementNamed(context, 'telaInicial');
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
