import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Turnos extends StatefulWidget {
  const Turnos({super.key});

  @override
  State<Turnos> createState() => _TurnosState();
}

class _TurnosState extends State<Turnos> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Map turma = ModalRoute.of(context)!.settings.arguments as Map;
    String materia = turma["materia"];
    var listaTurnos = db.collection('disciplinas').doc(materia).collection('turno').snapshots();

    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white, opacity: 1),
          title: Text(
            // 'Página inicial',
            'Selecione o turno',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: listaTurnos,
              builder: ((BuildContext context,
                  AsyncSnapshot<QuerySnapshot> querySnapshot) {
                if (querySnapshot.hasError) {
                  return Text("Erro ao recuperar dados");
                }
                if (querySnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final list = querySnapshot.data!.docs;

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ListTile(
                            title: Text(list[index]['turno']),
                            // subtitle: Text(list[index]['turno']),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                        // ListTile(
                        //     title: Text(list[index]['nome']),
                        //     subtitle: Text(list[index]['email']),
                        //     trailing: Icon(Icons.keyboard_arrow_right),
                        //     leading: CircleAvatar(
                        //       radius: 22,
                        //       backgroundColor: Colors.blue,
                        //       child: Text(list[index]['nome'][0]),
                        //     )),
                        onTap: () async {
                          // await
                          // Navigator.pushNamed(context, 'registrar');

                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Atenção!'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Você está entrando no modo de chamada'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('cancelar')),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(16)),
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              context, 'registrar', arguments: {
                                            "materia": materia,
                                            "turno": list[index]["turno"].toLowerCase()
                                          });
                                        },
                                        child: Text("Confirmar")),
                                  ],
                                );
                              });
                        },
                      );
                    },
                    itemCount: list.length,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                }
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '');
        },
      ),
    );
  }
}