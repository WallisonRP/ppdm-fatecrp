// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/tela_alunos.dart';
import 'package:ppdm_fatecrp/view/bottom_pages/tela_cursos.dart';
import 'package:ppdm_fatecrp/view/pages/alunos_por_turma.dart';
import 'package:ppdm_fatecrp/view/pages/main_navigation.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_aluno.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_rosto.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastrar_turma.dart';
import 'package:ppdm_fatecrp/view/pages/tela_cadastro.dart';
import 'package:ppdm_fatecrp/view/pages/tela_de_login.dart';
import 'package:ppdm_fatecrp/view/pages/tela_editar_perfil.dart';
import 'package:ppdm_fatecrp/view/pages/tela_perfil.dart';
import 'package:ppdm_fatecrp/view/pages/tela_sobre.dart';
import 'package:ppdm_fatecrp/view/pages/tela_turmas.dart';
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
    },
    debugShowCheckedModeBanner: false,
  ));
}
