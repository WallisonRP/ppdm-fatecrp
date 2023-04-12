import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppdm_fatecrp/controller/db/db_controller.dart';
import 'package:ppdm_fatecrp/model/aluno.dart';
import 'package:ppdm_fatecrp/view/pages/home.dart';
import 'package:ppdm_fatecrp/view/pages/login.dart';

class CheckUserLogin extends StatefulWidget {
  const CheckUserLogin({super.key});

  @override
  State<CheckUserLogin> createState() => _CheckUserLoginState();
}

class _CheckUserLoginState extends State<CheckUserLogin> {
  StreamSubscription? streamSubscription;
  final db = FirebaseFirestore.instance;

  CollectionReference _collectionRef = FirebaseFirestore.instance
      .collection("alunos")
      .doc('cursos')
      .collection('fatecADS');
  var student;
  List allStudents = [];

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // DatabaseHelper _dbHelper = DatabaseHelper.instance;
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final te = querySnapshot.docs.map((doc) => doc.data());

    for (int i = 0; i < allData.length; i++) {
      student = allData[i];
      allStudents.add({
        'nome': student['nome'],
        'id': student['ra'],
        'model_data': student['model_data']
      });
      saveStudentsInLocalDatabase(student);
    }
  }

  Future<void> saveStudentsInLocalDatabase(student) async {
    DatabaseHelper _dbHelper = DatabaseHelper.instance;
    var studentChecker =
        await _dbHelper.queryStudentByID(student['ra']);

    if (studentChecker == 1) {
      print('O estudante já está cadastrado!');
    } else {
      _dbHelper.insert(Student(
        id: student['ra'],
        name: student['nome'],
        modelData: student['model_data'],
      ));
      print('Estudante cadastrado com sucesso!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => TelaDeLogin())));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => MenuTelaInicial())));
      }
    });

    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamSubscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
