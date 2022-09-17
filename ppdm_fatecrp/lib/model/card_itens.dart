// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

CardItens(titulo, icon) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(left: 16, bottom: 16),
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffD9D9D9)),
      width: 100,
      height: 74,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}
