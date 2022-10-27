// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/menuDrawer.dart';
import '../bottom_pages/tela_alunos.dart';
import '../bottom_pages/tela_inicial.dart';
import '../bottom_pages/tela_menu.dart';
import '../bottom_pages/tela_turmas.dart';



class MenuTelaInicial extends StatefulWidget {
  const MenuTelaInicial({super.key});

  @override
  State<MenuTelaInicial> createState() => _MenuTelaInicialState();
}

class _MenuTelaInicialState extends State<MenuTelaInicial> {
  var _indiceAtual = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      TelaTurmas(),
      TelaMenu(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: _bodies[_indiceAtual],
      endDrawer: MenuDrawer(),

      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (index) {
            _onItemTapped(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffD9D9D9),
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Alunos', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'Turmas', icon: Icon(Icons.group)),
            BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu))
          ]),
    );
  }
}