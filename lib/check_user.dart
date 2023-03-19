import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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


CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("alunos").doc('cursos').collection('ads').doc('4semestre').collection('alunos');

Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
}

  getStudents() async {
    db.collection("alunos").doc('cursos').collection('ads').doc('4semestre').collection('alunos').get().then(
      (res) {
        print("Successfully completed");
        print(res);
      },
      onError: (e) => print("Error completing: $e"),
    );
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => MenuTelaInicial())));
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
