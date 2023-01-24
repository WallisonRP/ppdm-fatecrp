import 'package:flutter/material.dart';
import 'package:ppdm_fatecrp/view/widgets/button_icon.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 160,
                color: Colors.green,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Aluno cadastrado com sucesso!!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 78, 78, 78)),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(80, 14, 80, 14)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tela Inicial',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.home,
                color: Colors.white,
              )
            ],
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'telaInicial');
          },
        ));
  }
}
