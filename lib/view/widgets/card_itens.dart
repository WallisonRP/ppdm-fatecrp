// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

CardItens(titulo, icon, context) {
  var largura = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xff2196F3).withOpacity(0.7),
            Color(0xff007BFF).withOpacity(0.6)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.clamp),
      border: Border.all(color: Color.fromARGB(255, 172, 191, 206)),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0xff7FB5F2).withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
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
          color: Colors.white,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          titulo,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
