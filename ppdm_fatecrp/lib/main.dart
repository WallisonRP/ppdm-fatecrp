import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/body_view/tela_alunos.dart';
import 'package:ppdm_fatecrp/view/body_view/tela_turmas.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_aluno.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_rosto.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_turma.dart';
import 'package:ppdm_fatecrp/view/tela_cadastro.dart';
import 'package:ppdm_fatecrp/view/tela_de_login.dart';
import 'package:ppdm_fatecrp/view/main_navigation.dart';
import 'package:ppdm_fatecrp/view/tela_editar_perfil.dart';
import 'package:ppdm_fatecrp/view/tela_perfil.dart';
import 'package:ppdm_fatecrp/view/tela_sobre.dart';
import 'package:ppdm_fatecrp/view/turma.dart';

void main() {
  runApp(MaterialApp(
    // home: TelaSobre(),
    initialRoute: 'telaInicial',
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
