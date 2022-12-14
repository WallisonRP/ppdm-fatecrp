// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/menuDrawer.dart';
import '../bottom_pages/tela_alunos.dart';
import '../bottom_pages/tela_inicial.dart';
import '../bottom_pages/tela_menu.dart';
import '../bottom_pages/tela_cursos.dart';

class MenuTelaInicial extends StatefulWidget {
  const MenuTelaInicial({super.key});

  @override
  State<MenuTelaInicial> createState() => _MenuTelaInicialState();
}

class _MenuTelaInicialState extends State<MenuTelaInicial> {
  final firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';
  var _indiceAtual = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  void _onItemTapped(index) {
    index == 3
        ? _scaffoldKey.currentState!.openEndDrawer()
        : setState(() {
            _indiceAtual = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _bodies = [
      TelaInicial(),
      TelaAlunos(),
      TelaCursos(),
      TelaMenu(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: _bodies[_indiceAtual],
      endDrawer: MenuDrawer(
        nome: nome,
        email: email,
      ),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (index) {
            _onItemTapped(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          fixedColor: Color(0xff2196F3),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                label: 'Inicio',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Alunos',
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person)),
            BottomNavigationBarItem(
                label: 'Turmas',
                icon: Icon(Icons.group_outlined),
                activeIcon: Icon(Icons.group)),
            BottomNavigationBarItem(
                label: 'Menu',
                icon: Icon(Icons.menu_outlined),
                activeIcon: Icon(Icons.menu))
          ]),
    );
  }

  getUser() async {
    User? usuario = await firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }
}
