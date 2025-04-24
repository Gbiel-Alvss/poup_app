import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';

class MenuScreen extends StatelessWidget {
  final VoidCallback onClose;

  const MenuScreen({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            color: AppTheme.lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  menuItem(FontAwesomeIcons.house, 'Início'),
                  menuItem(FontAwesomeIcons.user, 'Perfil'),
                  menuItem(FontAwesomeIcons.chartLine, 'Investimentos'),
                  menuItem(FontAwesomeIcons.robot, 'Nina'),
                  menuItem(FontAwesomeIcons.gear, 'Configurações'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
