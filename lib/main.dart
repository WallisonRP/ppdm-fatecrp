// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ppdm_fatecrp/services_locator.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/alunos.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/cursos.dart';
import 'package:ppdm_fatecrp/view/pages/alunos_por_turma.dart';
import 'package:ppdm_fatecrp/view/pages/checkout.dart';
import 'package:ppdm_fatecrp/view/pages/disciplinas.dart';
import 'package:ppdm_fatecrp/view/pages/face_register.dart';
import 'package:ppdm_fatecrp/view/pages/home.dart';
import 'package:ppdm_fatecrp/view/pages/cadastrar_aluno.dart';
import 'package:ppdm_fatecrp/view/pages/registrar.dart';
import 'package:ppdm_fatecrp/view/pages/tela_aviso.dart';
import 'package:ppdm_fatecrp/view/pages/cadastrar_turma.dart';
import 'package:ppdm_fatecrp/view/pages/cadastro.dart';
import 'package:ppdm_fatecrp/view/pages/login.dart';
import 'package:ppdm_fatecrp/view/pages/editar_perfil.dart';
import 'package:ppdm_fatecrp/view/pages/perfil.dart';
import 'package:ppdm_fatecrp/view/pages/sobre.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/turmas.dart';
import 'package:ppdm_fatecrp/view/pages/turma.dart';
import 'package:firebase_core/firebase_core.dart';
import 'check_user.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  

  setupServices();
  runApp(MaterialApp(
    // home: TelaSobre(),
    initialRoute: 'checkUser',
    routes: {
      'checkUser': (context) => CheckUserLogin(),
      'login': (context) => TelaDeLogin(),
      'cadastro': (context) => TelaDeCadastro(),
      'telaInicial': (context) => MenuTelaInicial(),
      'cadastrarAluno': (context) => TelaCadastrarAluno(),
      'cadastrarRosto': (context) => TelaCadastrarRosto(),
      'sobre': (context) => TelaSobre(),
      'verPerfil': (context) => TelaPerfil(),
      // 'editarPerfil': (context) => EditarPerfilAluno(),
      'verTurma': (context) => Turma(),
      'cadastrarTurma': (context) => TelaCadastrarTurma(),
      'telaTurmas': (context) => TelaTurmas(),
      'telaAlunosPorTurmas': (context) => TelaAlunosPorTurma(),
      // 'telaAlunos': (context) => TelaAlunos(),
      // 'telaTurma': (context) => TelaTurmas(),
      'faceRegister': (context) => FaceRegister(),
      'checkout': (context) => Checkout(),
      'registrar': (context) => Registrar(),
      'disciplinas': (context) => Disciplinas(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
