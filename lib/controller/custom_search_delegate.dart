// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/aluno.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final pessoas;

  CustomSearchDelegate(this.pessoas);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // print("Pesquisa sendo realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(),//Aluno(pessoas[index]),
          onTap: () {},
        );
      },
    );
    // print("O valor digitado foi: $query");
/*
    List<String> lista = [];
    if (query.isNotEmpty) {
      lista = ["Android", "HTML", "Ios"]
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
    */
  }
}
