import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.png'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 16),
              // Nome e e-mail
              Text(
                'Rodrigo Angelim',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'usuario@email.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 32),
              // Área de informações
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey, // cinza conforme sua paleta
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildItem('Informações Pessoais'),
                    _buildItem('Informações Financeiras'),
                    _buildItem('Documentos'),
                    _buildItem('Segurança'),
                    _buildItem('Ajuda e Suporte'),
                    _buildItem('Política de privacidade'),
                  ],
                ),
              ),
              const Spacer(),
              // Botão sair menos arredondado
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(4), // bordas mais quadradas
                    ),
                  ),
                  child: const Text('Sair'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String label) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing:
          Icon(Icons.arrow_forward_ios, color: AppTheme.primaryColor, size: 16),
      onTap: () {},
    );
  }
}
