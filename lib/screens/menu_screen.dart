import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'investments_screen.dart';
import 'nina_screen.dart';

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
                  menuItem(context, FontAwesomeIcons.house, 'Início', const HomeScreen()),
                  menuItem(context, FontAwesomeIcons.user, 'Perfil', PerfilPage()),
                  menuItem(context, FontAwesomeIcons.chartLine, 'Investimentos', const InvestmentsScreen()),
                  menuItem(context, FontAwesomeIcons.robot, 'Nina', const NinaScreen()),
                  menuItem(context, FontAwesomeIcons.gear, 'Configurações', const Placeholder()), // Substitua futuramente
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget menuItem(BuildContext context, IconData icon, String title, Widget destination) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primaryColor),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
