import 'package:flutter/material.dart';

CaixaDeTextoRedonda(
    {required String label,
    required TextEditingController controller,
    required bool leitura}) {
  return TextField(
    controller: controller,
    readOnly: leitura,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ),
      labelStyle: TextStyle(color: Colors.black),
      labelText: label,
    ),
  );
}
