import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Disciplinas extends StatefulWidget {
  const Disciplinas({super.key});

  @override
  State<Disciplinas> createState() => _DisciplinasState();
}

class _DisciplinasState extends State<Disciplinas> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var listaDisciplinas = db.collection('disciplinas').snapshots();
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white, opacity: 1),
          title: Text(
            // 'Página inicial',
            'Selecione a Disciplina',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 224, 224, 224)),
              ),
            ),
            child: Row(
              children: [
                Text("Ordem alfabética"),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: listaDisciplinas,
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
                            title: Text(list[index]['nome_disciplina']),
                            // subtitle: Text(list[index]['turno']),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            leading: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.blue,
                              child: Text(list[index]['nome_disciplina'][0]),
                            )),
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
                                            "materia": list[index]
                                                ["sigla"]
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
