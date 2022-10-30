// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../check_user.dart';
import '../../view/pages/main_navigation.dart';

class LoginController {
  final firebaseAuth = FirebaseAuth.instance;

  void login(
      {required String email,
      required String senha,
      required BuildContext context}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => MenuTelaInicial())));
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('O formato do email é inválido.'),
            backgroundColor: Colors.redAccent,
          ));
          break;
        case 'user-not-found':
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuário não encontrado.'),
            backgroundColor: Colors.redAccent,
          ));
          break;
        case 'wrong-password':
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Senha incorreta.'),
            backgroundColor: Colors.redAccent,
          ));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.code.toString()),
            backgroundColor: Colors.redAccent,
          ));
      }
    });
  }

  criarConta(
      {required String email,
      required String senha,
      required BuildContext context,
      required String nome,
      required String sobrenome}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      if (userCredential != null) {
        userCredential.user!.updateDisplayName('$nome $sobrenome');
        Navigator.pop(context);
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: ((context) => CheckUserLogin())),
        //     (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Crie uma senha mais forte'),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('O e-mail já está em uso'),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }

  void sair(BuildContext context) async {
    await firebaseAuth.signOut().then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CheckUserLogin())));
  }

  void esqueceuSenha(String email) {}
}
