import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/widgets/perfil_menu.dart';

import '../../controller/firebase/auth.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              otherAccountsPictures: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(110),
                  child: GestureDetector(
                      onTap: () {
                        LoginController().sair(context);
                      },
                      child: Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 179, 39, 29),
                      )),
                ),
              ],
              currentAccountPicture: CircleAvatar(
                child: Image.asset('lib/assets/images/profile.png'),
              ),
              accountName: Text('Gabriel Oliveira'),
              accountEmail: Text('oliveira.gap@gmail.com')),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                bottom: BorderSide(width: 0.1),
              )),
              padding: EdgeInsets.fromLTRB(16, 22, 0, 25),
              child: Text(
                'Exportar dados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'sobre');
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                bottom: BorderSide(width: 0.1),
              )),
              padding: EdgeInsets.fromLTRB(16, 22, 0, 25),
              child: Text(
                'Sobre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                      // bottom: BorderSide(width: 0.08),
                      )),
              padding: EdgeInsets.fromLTRB(16, 22, 0, 25),
              child: Text(
                'Ajuda',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
