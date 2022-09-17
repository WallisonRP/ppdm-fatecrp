import 'package:flutter/material.dart';

BotaoFullWidth(rotulo) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 194, 194, 194),
          padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
      child: Text(
        rotulo,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
  );
}
