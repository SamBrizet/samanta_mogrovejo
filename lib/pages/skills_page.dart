import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  final List<String> technicalSkills = const [
    'Flutter',
    'Dart',
    'Firebase',
    'Git',
    'REST APIs',
    'Provider / Bloc',
    'Clean Architecture',
    'Figma',
  ];

  final List<String> softSkills = const [
    'Comunicación',
    'Trabajo en equipo',
    'Resolución de problemas',
    'Creatividad',
    'Organización',
    'Atención al detalle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Habilidades'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Habilidades Técnicas 🛠️',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: technicalSkills
                  .map((skill) => _SkillChip(label: skill))
                  .toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              'Habilidades Blandas 🌸',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  softSkills.map((skill) => _SkillChip(label: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.pink.shade50,
      labelStyle: const TextStyle(color: Colors.pink),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.pinkAccent),
      ),
    );
  }
}
