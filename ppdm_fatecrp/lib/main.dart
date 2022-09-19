import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_aluno.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_rosto.dart';
import 'package:ppdm_fatecrp/view/tela_cadastrar_turma.dart';
import 'package:ppdm_fatecrp/view/tela_cadastro.dart';
import 'package:ppdm_fatecrp/view/tela_de_login.dart';
import 'package:ppdm_fatecrp/view/menu_tela_inicial.dart';
import 'package:ppdm_fatecrp/view/tela_editar_perfil.dart';
import 'package:ppdm_fatecrp/view/tela_perfil.dart';
import 'package:ppdm_fatecrp/view/tela_sobre.dart';
import 'package:ppdm_fatecrp/view/turma.dart';

void main() {
  runApp(MaterialApp(
    home: TelaSobre(),
    debugShowCheckedModeBanner: false,
  ));
}
