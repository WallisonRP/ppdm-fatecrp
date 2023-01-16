import 'dart:async';

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
