// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

CardItens(titulo, icon, context) {
  var largura = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Color(0xffD9D9D9)),
    // width: largura ,
    height: 700,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 34,
        ),
        Text(
          titulo,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
