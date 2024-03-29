import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/widgets/perfil_menu.dart';

import '../../controller/firebase/auth.dart';

class MenuDrawer extends StatelessWidget {
  final String nome;
  final String email;
  const MenuDrawer({super.key, required this.nome, required this.email});

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
                        color: Color.fromARGB(255, 241, 59, 46),
                      )),
                ),
              ],
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 109, 185, 247),
                radius: 30,
                child: Text(
                  nome[0].toUpperCase(),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              accountName: Text(nome),
              accountEmail: Text(email)),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                bottom: BorderSide(width: 0.1),
              )),
              padding: EdgeInsets.fromLTRB(16, 22, 0, 25),
              child: Text(
                'Disciplinas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'disciplinas');

            },
          ),GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                // top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                bottom: BorderSide(width: 0.1),
              )),
              padding: EdgeInsets.fromLTRB(16, 22, 0, 25),
              child: Text(
                'Sincronizar dados',
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
