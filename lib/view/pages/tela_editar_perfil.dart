import 'package:flutter/material.dart';

import '../widgets/caixa_de_texto_redonda.dart';


class EditarPerfilAluno extends StatefulWidget {
  const EditarPerfilAluno({super.key});

  @override
  State<EditarPerfilAluno> createState() => _EditarPerfilAlunoState();
}

class _EditarPerfilAlunoState extends State<EditarPerfilAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
          ),
        title: Text('Editar Perfil'),
        backgroundColor: Color(0xffD9D9D9)
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    'Dados pessoais',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                CaixaDeTextoRedonda('Nome'),
                SizedBox(height: 16),
                CaixaDeTextoRedonda('Sobrenome'),
                SizedBox(height: 16),
                CaixaDeTextoRedonda('Data de Nascimento'),
                SizedBox(height: 16),
                CaixaDeTextoRedonda('Telefone'),
                SizedBox(height: 16),
                CaixaDeTextoRedonda('E-mail'),
                SizedBox(height: 16),
                CaixaDeTextoRedonda('RA'),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Voltar',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}