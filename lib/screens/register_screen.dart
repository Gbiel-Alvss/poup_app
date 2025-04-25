import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int currentStep = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  String? selectedGoal;

  final List<String> goals = [
    'Economizar',
    'Viajar',
    'Alcançar sobras',
    'Alcançar investimentos',
  ];

  void nextStep() {
    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });
    } else {
      debugPrint('Nome: ${nameController.text}');
      debugPrint('CPF: ${cpfController.text}');
      debugPrint('Nascimento: ${birthController.text}');
      debugPrint('Objetivo: $selectedGoal');
      debugPrint('Renda: ${incomeController.text}');
      Navigator.pop(context);
    }
  }

  Widget buildInputStep(String label, TextEditingController controller,
      {String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primaryColor),
            ),
          ),
          cursorColor: AppTheme.primaryColor,
          style: const TextStyle(color: AppTheme.primaryColor),
        ),
      ],
    );
  }

  Widget buildGoalStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Qual o seu objetivo com o Poupapp?',
          style: TextStyle(
              fontSize: 18,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        ...goals.map((goal) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGoal == goal
                      ? AppTheme.primaryColor
                      : Colors.grey[300],
                  foregroundColor: selectedGoal == goal
                      ? Colors.white
                      : AppTheme.primaryColor,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  setState(() {
                    selectedGoal = goal;
                  });
                },
                child: Text(goal),
              ),
            )),
      ],
    );
  }

  Widget buildStep() {
    switch (currentStep) {
      case 0:
        return buildInputStep("Primeiro informe seu nome ...", nameController);
      case 1:
        return buildInputStep("Agora seu CPF", cpfController,
            hint: "Insira apenas os números do CPF");
      case 2:
        return buildInputStep("Agora sua data de nascimento", birthController,
            hint: "00 / 00 / 0000");
      case 3:
        return buildGoalStep();
      case 4:
        return buildInputStep("Qual é sua renda estimada?", incomeController,
            hint: "R\$ XXXXX,XX");
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: buildStep()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text('Próximo', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
