import 'package:flutter/material.dart';
import '../widgets/animated_profile_card.dart';
import '../widgets/custom_notification.dart';
import '../widgets/theme_switcher.dart';

class MyWidgetsPage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const MyWidgetsPage({
    required this.isDarkMode,
    required this.onThemeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                _WidgetSection(
                  title: 'Tarjeta de Perfil Animada',
                  description: 'Toca la tarjeta para ver la animación y más información.',
                  child: AnimatedProfileCard(),
                ),
                SizedBox(height: 32),
                _WidgetSection(
                  title: 'Notificación Animada',
                  description: 'Presiona el botón para mostrar una notificación personalizada.',
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => CustomNotification(
                            message: '¡Esto es una notificación animada!',
                          ),
                        );
                      },
                      child: Text('Mostrar notificación'),
                    ),
                  ),
                ),
                _WidgetSection(
                  title: 'Modo Claro/Oscuro',
                  description: 'Activa o desactiva el modo oscuro.',
                  child: ThemeSwitcher(
                    isDarkMode: isDarkMode,
                    onChanged: onThemeChanged,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
     final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: colors.onSurface,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mis Widgets',
                style: TextStyle(
                 color: colors.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ejemplos de widgets personalizados',
                style: TextStyle(
                  color: colors.onSurface.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WidgetSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const _WidgetSection({
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                     color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    )),
            SizedBox(height: 6),
            Text(description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                       color: colors.onSurface.withOpacity(0.7),
                    )),
            SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}