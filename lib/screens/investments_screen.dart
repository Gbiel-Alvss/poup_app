import 'package:flutter/material.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1655),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1655),
        elevation: 0,
        title: const Text("Investimentos"),
      ),
      body: const Center(
        child: Text(
          "Conteúdo de Investimentos",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
