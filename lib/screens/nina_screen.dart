import 'package:flutter/material.dart';

class NinaScreen extends StatelessWidget {
  const NinaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1655),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 60),
            Text("Olá!", style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 8),
            Text("Sou a Nina 👩‍💼",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 16),
            Text("Como posso te ajudar hoje?",
                style: TextStyle(color: Colors.white70, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
