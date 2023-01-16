// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';

class Aluno1 {
  String nome;
  String ra;
  List modelData;

  Aluno1({
    required this.nome,
    required this.ra,
    required this.modelData,
  });

  static Aluno1 fromMap(Map<String, dynamic> user) {
    return Aluno1(
      nome: user['user'],
      ra: user['ra'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'nome': nome,
      'ra': ra,
      'model_data': jsonEncode(modelData),
    };
  }
}

Aluno(pessoa) {
  return ListTile(
      title: Text(pessoa['nome']),
      subtitle: Text(pessoa['email']),
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.blue,
        child: Text(pessoa['nome'][0]),
      ));
}





















/*
Container(
    child: ListTile(
      visualDensity: VisualDensity(vertical: 2),
      minVerticalPadding: 20,
      title: Text('${pessoa["nome"]}'),
      subtitle: Text('${pessoa["email"]}'),
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffD9D9D9)),
        width: 60,
        height: 70,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 28,
          )
        ],
      ),
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom:
            BorderSide(width: 1.0, color: Color.fromARGB(255, 224, 224, 224)),
      ),
    ),
  )

 */
