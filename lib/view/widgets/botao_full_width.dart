import 'package:flutter/material.dart';

BotaoFullWidth(rotulo, context, rota) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, rota);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 194, 194, 194),
          padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(
        rotulo,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ),
  );
}
