// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

CardItens(titulo, icon, context) {
  var largura = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffE3E3E3)),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5), // changes position of shadow
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
          color: Colors.blueAccent,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          titulo,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
