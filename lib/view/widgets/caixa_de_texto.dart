import 'package:flutter/material.dart';

CaixaDeTexto(label, icon, tamanho, controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      // isDense: true,
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(
        icon,
        size: tamanho,
        color: Colors.black,
      ),
    ),
  );
}
