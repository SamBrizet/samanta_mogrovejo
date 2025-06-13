import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Contacto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¡Hablemos! 💬',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _ContactCard(
              icon: Icons.email,
              title: 'Correo',
              subtitle: 'samanta.dev@gmail.com',
              onTap: () {
                // Aquí podrías implementar launchEmail
              },
            ),
            _ContactCard(
              icon: Icons.phone,
              title: 'Teléfono',
              subtitle: '+51 999 888 777',
            ),
            _ContactCard(
              icon: Icons.link,
              title: 'LinkedIn',
              subtitle: 'linkedin.com/in/samantabrizet',
              onTap: () {
                // lanzar URL con url_launcher
              },
            ),
            _ContactCard(
              icon: Icons.code,
              title: 'GitHub',
              subtitle: 'github.com/samantadev',
              onTap: () {
                // lanzar URL con url_launcher
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: onTap != null ? const Icon(Icons.open_in_new) : null,
      ),
    );
  }
}
