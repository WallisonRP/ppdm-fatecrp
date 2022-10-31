import 'package:flutter/material.dart';

import '../widgets/caixa_de_texto_redonda.dart';


class TelaCadastrarAluno extends StatefulWidget {
  const TelaCadastrarAluno({super.key});

  @override
  State<TelaCadastrarAluno> createState() => _TelaCadastrarAlunoState();
}

class _TelaCadastrarAlunoState extends State<TelaCadastrarAluno> {
  TextEditingController _nomeCompleto = TextEditingController();
  TextEditingController _sobrenome = TextEditingController();
  TextEditingController _dataNascimento = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _ra = TextEditingController();
  TextEditingController _curso = TextEditingController();
  TextEditingController _turma = TextEditingController();
  TextEditingController _periodo = TextEditingController();

  Map<String, String> aluno = {
    "nome": "",
    "sobrenome": "",
    "dataNascimento": "",
    "email": "",
    "ra": "",
    "curso": "",
    "turma": "",
    "periodo": ""
  };

  String? _selectedValue = 'ads';
  String ads = 'Análise e Desenvolvimento de Sistemas';
  String sb = 'Gestão de Negócios e Inovação';
  String gni = 'Sistemas Biomédicos';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          title: Text(
            'Cadastrar aluno',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffD9D9D9),
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
                TextFieldCadastro(label: 'Nome Completo', controller: _nomeCompleto, variavel: 'nome'),
                SizedBox(height: 16),
                TextFieldCadastro(label: 'Data de Nascimento', controller: _dataNascimento, variavel: 'dataNascimento'),
                SizedBox(height: 16),
                TextFieldCadastro(label: 'E-mail', controller: _email, variavel: 'email'),
                SizedBox(height: 16),
                TextFieldCadastro(label: 'RA', controller: _ra, variavel: 'ra'),
                SizedBox(height: 16),
                DropdownButton(
                  value: _selectedValue,
                  items: [
                    
                    DropdownMenuItem(child: Text(ads), value: ads,),
                    DropdownMenuItem(child: Text(gni), value: gni,),
                    DropdownMenuItem(child: Text(sb), value: sb,),
                    ], onChanged: (selectedValue){
                      _selectedValue = selectedValue;
                      aluno['curso'] = selectedValue!;
                    }),
                TextFieldCadastro(label: 'Curso', controller: _curso, variavel: 'curso'),
                SizedBox(height: 16),
                TextFieldCadastro(label: 'Turma', controller: _turma, variavel: 'turma'),
                SizedBox(height: 16),
                TextFieldCadastro(label: 'Período', controller: _periodo, variavel: 'periodo'),
                
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, 'cadastrarRosto');
                        print(aluno);
                      },
                      child: Text(
                        'Proximo',
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
        ));
  }


  TextFieldCadastro({required String label, required TextEditingController controller, required String variavel}) {
  return TextField(
    controller: controller,
    onChanged: (value){
      aluno[variavel] = value;
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ),
      labelStyle: TextStyle(color: Colors.black),
      labelText: label,
    ),
  );
}
}
