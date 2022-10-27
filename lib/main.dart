// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/tela_alunos.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/tela_turmas.dart';
import 'package:ppdm_fatecrp/view/pages/main_navigation.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_aluno.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_rosto.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_turma.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastro.dart';
import 'package:ppdm_fatecrp/view/pages/tela_de_login.dart';
import 'package:ppdm_fatecrp/view/pages/tela_editar_perfil.dart';
import 'package:ppdm_fatecrp/view/pages/tela_perfil.dart';
import 'package:ppdm_fatecrp/view/pages/tela_sobre.dart';
import 'package:ppdm_fatecrp/view/pages/turma.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  var db = FirebaseFirestore.instance;

// // Add a new document with a generated ID
//   db.collection("users").add(user).then((DocumentReference doc) =>
//       print('DocumentSnapshot added with ID: ${doc.id}'));

// // Create a new user with a first and last name
//   final user2 = <String, dynamic>{
//     "first": "Alan",
//     "middle": "Mathison",
//     "last": "Turing",
//     "born": 1912
//   };

// // Add a new document with a generated ID
//   db.collection("users").add(user2).then((DocumentReference doc) =>
//       print('DocumentSnapshot added with ID: ${doc.id}'));

  // await db.collection("users").get().then((event) {
  //   for (var doc in event.docs) {
  //     print("${doc.id} => ${doc.data()}");
  //   }
  // });

  runApp(MaterialApp(
    // home: TelaSobre(),
    initialRoute: 'login',
    routes: {
      'login': (context) => TelaDeLogin(),
      'cadastro': (context) => TelaDeCadastro(),
      'telaInicial': (context) => MenuTelaInicial(),
      'cadastrarAluno': (context) => TelaCadastrarAluno(),
      'cadastrarRosto': (context) => TelaCadastrarRosto(),
      'sobre': (context) => TelaSobre(),
      'verPerfil': (context) => TelaPerfil(),
      'editarPerfil': (context) => EditarPerfilAluno(),
      'verTurma': (context) => Turma(),
      'cadastrarTurma': (context) => TelaCadastrarTurma(),
      // 'telaAlunos': (context) => TelaAlunos(),
      // 'telaTurma': (context) => TelaTurmas(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
