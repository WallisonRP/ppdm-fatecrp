import 'package:flutter/material.dart';

testePerfil() {
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset('lib/assets/images/profile.png'),
      Column(
        children: [
          Text('Gabriel Oliveira'),
        ],
      )
    ],
  );
}
