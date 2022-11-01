import 'package:flutter/material.dart';

CaixaDeTexto(label, icon, tamanho, controller) {
  return TextField(
    controller: controller,
    style: TextStyle(fontSize: 16.0, color: Colors.black),
    // cursorHeight: 25,
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(16),
      hintText: label,
      hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
      prefixIcon: Icon(
          icon,
          size: tamanho,
          color: Colors.black,
        ),
    ),
  );
}
