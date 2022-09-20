// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/card_itens.dart';
import '../model/testDrawer.dart';
import 'menu_view/tela_alunos.dart';
import 'menu_view/tela_inicial.dart';
import 'menu_view/tela_menu.dart';
import 'menu_view/tela_turmas.dart';

class MenuTelaInicial extends StatefulWidget {
  const MenuTelaInicial({super.key});

  @override
  State<MenuTelaInicial> createState() => _MenuTelaInicialState();
}

class _MenuTelaInicialState extends State<MenuTelaInicial> {
  int _indiceAtual = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    void _onItemTapped(int index) {
    index == 3
        ? _scaffoldKey.currentState!.openEndDrawer()
        : setState(() {
            _indiceAtual = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      TelaInicial(),
      TelaAlunos(),
      TelaTurmas(),
      TelaMenu(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      body: _telas[_indiceAtual],
      endDrawer: TesteDrawer(),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: _indiceAtual,
          onTap: (index) {
            _onItemTapped(index);
            // setState(() {
            //   _indiceAtual = index;
            // });
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
          ])
,
    );
  }
}



