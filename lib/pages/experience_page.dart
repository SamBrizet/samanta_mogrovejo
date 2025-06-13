import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  final List<ExperienceItem> experienceList = const [
    ExperienceItem(
      company: 'Agencia Creativa PinkCode',
      role: 'Flutter Developer',
      period: '2022 - Presente',
      description:
          'Desarrollo de apps móviles y web con Flutter. Implementación de arquitectura limpia, integración con Firebase, diseño responsive y trabajo colaborativo con diseñadores UI/UX.',
    ),
    ExperienceItem(
      company: 'Startup NovaApps',
      role: 'Junior Flutter Dev',
      period: '2021 - 2022',
      description:
          'Creación de módulos interactivos para apps educativas. Mantenimiento de código, migración a null safety y pruebas de UI.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Experiencia'),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Experiencia Laboral 💼',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 20),
            ...experienceList.map((exp) => _ExperienceCard(exp: exp)),
          ],
        ),
      ),
    );
  }
}

class ExperienceItem {
  final String company;
  final String role;
  final String period;
  final String description;

  const ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
  });
}

class _ExperienceCard extends StatelessWidget {
  final ExperienceItem exp;

  const _ExperienceCard({required this.exp});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade50,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.work_outline, color: Colors.pinkAccent, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.role,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  Text(
                    exp.company,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    exp.period,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exp.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
