// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/controller/db/db_controller.dart';

import '../widgets/caixa_de_texto_redonda.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';

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

  final emailValidator =
      ValidationBuilder(localeName: 'pt-br').email().maxLength(50).build();

  Map<String, dynamic> aluno = {
    "nome": "",
    "dataNascimento": "",
    "email": "",
    "ra": "",
    "curso": "",
    "turma": "",
    "periodo": ""
  };

  List<String> cursos = [
    'Análise e Desenvolvimento de Sistemas',
    // 'Gestão de Negócios e Inovação',
    // 'Sistemas Biomédicos'
  ];

  List<String> turmas = [
    '1º Semestre',
    '2º Semestre',
    '3º Semestre',
    '4º Semestre',
    '5º Semestre',
    '6º Semestre',
  ];

  List<String> periodos = [
    'Manhã',
    'Noite',
  ];

  String? _selectedValue = 'ads';
  String ads = 'Análise e Desenvolvimento de Sistemas';
  String sb = 'Gestão de Negócios e Inovação';
  String gni = 'Sistemas Biomédicos';
  // String selectedDropdown = 'Análise e Desenvolvimento de Sistemas';
  String? cursoSelecionado;
  String? turmaSelecionada;
  String? periodoSelecionado;

  final formKey = GlobalKey<FormState>();
  final raKey = GlobalKey<FormFieldState>();
  var testeform;

  _checkRA(String ra) async {
    DatabaseHelper _dbHelper = DatabaseHelper.instance;

    var studentChecker = await _dbHelper.queryStudentByID(ra);
    if (studentChecker == 1) {
      testeform = studentChecker;
    } else if (studentChecker == 0) {
      testeform = studentChecker;
    }

    return studentChecker;
  }

  // String? _teste(String? value) {
  //   int studentChecker = _checkRA(value!);

  //   if (value == null || value.isEmpty) {
  //     return 'Campo obrigatório';
  //   }
  //   print('aaaaaaaaaaaaaaaaaaaaaaa $studentChecker');
  //   if (studentChecker == 1) {
  //     return 'RA já existente';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Cadastrar aluno',
            style: TextStyle(color: Colors.white),
          ),
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
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFieldCadastro(
                            label: 'Nome Completo',
                            controller: _nomeCompleto,
                            variavel: 'nome',
                            cap: TextCapitalization.words,
                            teclado: TextInputType.name,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                            }),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _dataNascimento,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Data de Nascimento',
                          ),
                          validator: (String? value) {
                            if(value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                          },
                          onChanged: (value) {
                          aluno['dataNascimento'] = value;

                          },
                          readOnly: true,
                                          onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    locale: Locale('pt'),
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(1920), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2024)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         _dataNascimento.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
                        ),
                        // TextFieldCadastro(
                        //     label: 'Data de Nascimento',
                        //     controller: _dataNascimento,
                        //     variavel: 'dataNascimento',
                        //     teclado: TextInputType.datetime,
                        //     validator: (String? value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Campo obrigatório';
                        //       }
                        //     }),
                        SizedBox(height: 16),
                        TextFieldCadastro(
                            label: 'E-mail',
                            controller: _email,
                            variavel: 'email',
                            teclado: TextInputType.emailAddress,
                            validator: emailValidator),
                        SizedBox(height: 16),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _ra,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'RA',
                          ),
                          key: raKey,
                          validator: (String? value) {
                            _checkRA(value!);
                            var _studentChecker = testeform;

                            if(value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            if (_studentChecker == 1) {
                              return 'RA já existente';
                            }
                          },
                          onChanged: (value) {
                            _checkRA(value);
                          aluno['ra'] = value;

                          },
                        )
                        // TextFieldCadastro(
                        //     label: 'RA',
                        //     controller: _ra,
                        //     variavel: 'ra',
                        //     teclado: TextInputType.number,
                        //     validator: (String? value) {
                        //       var studentChecker = _checkRA(value!);

                        //       if (value == null || value.isEmpty) {
                        //         return 'Campo obrigatório';
                        //       }
                        //       if (studentChecker == 1) {
                        //         return 'RA já existente';
                        //       }
                        //     }),
                      ],
                    )),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    underline: Container(),
                    style: TextStyle(color: Colors.black),
                    hint: Text(
                      'Selecione o curso',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    isExpanded: true,
                    value: cursoSelecionado,
                    items: cursos.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          '$item',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      if (value == cursos[0]) {
                        aluno['curso'] = 'fatecADS';
                      } else if (value == cursos[1]) {
                        aluno['curso'] = 'fatecGNI';
                      } else if (value == cursos[2]) {
                        aluno['curso'] = 'fatecSBM';
                      }

                      setState(() {
                        cursoSelecionado = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    underline: Container(),
                    style: TextStyle(color: Colors.black),
                    hint: Text(
                      'Selecione a turma',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    isExpanded: true,
                    value: turmaSelecionada,
                    items: turmas.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          '$item',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      if (value == turmas[0]) {
                        aluno['turma'] = '1semestre';
                      } else if (value == turmas[1]) {
                        aluno['turma'] = '2semestre';
                      } else if (value == turmas[2]) {
                        aluno['turma'] = '3semestre';
                      } else if (value == turmas[3]) {
                        aluno['turma'] = '4semestre';
                      } else if (value == turmas[4]) {
                        aluno['turma'] = '5semestre';
                      } else if (value == turmas[5]) {
                        aluno['turma'] = '6semestre';
                      }
                      // aluno['turma'] = '4semestre';
                      setState(() {
                        turmaSelecionada = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    underline: Container(),
                    style: TextStyle(color: Colors.black),
                    hint: Text(
                      'Selecione o periodo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    isExpanded: true,
                    value: periodoSelecionado,
                    items: periodos.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          '$item',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      if (value == periodos[0]) {
                        aluno['periodo'] = 'manha';
                      } else if (value == periodos[1]) {
                        aluno['periodo'] = 'noite';
                      }

                      setState(() {
                        periodoSelecionado = value;
                      });
                    },
                  ),
                ),
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
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(26, 18, 26, 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var formCheck = formKey.currentState?.validate();
                        var raCheck = raKey.currentState?.validate();

                        if(formCheck == true && raCheck == true) {
                        Navigator.pushNamed(context, 'cadastrarRosto',
                            arguments: aluno);
                        }

                        // _checkRA(aluno['ra']);
                      },
                      child: Text(
                        'Proximo',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
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

  TextFieldCadastro(
      {required String label,
      required TextEditingController controller,
      required String variavel,
      required TextInputType teclado,
      required validator,
      cap}) {
    return TextFormField(
      textCapitalization: cap ?? TextCapitalization.none,
      validator: validator,
      keyboardType: teclado,
      controller: controller,
      onChanged: (value) {
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
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.redAccent)),
        focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
        labelStyle: TextStyle(color: Colors.black),
        labelText: label,
      ),
    );
  }

  
}
