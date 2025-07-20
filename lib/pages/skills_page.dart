import 'package:flutter/material.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            'Habilidades',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSkillSection(
              'Habilidades Técnicas',
              Icons.construction,
              Color(0xFF4ECDC4),
              [
                {'name': 'Flutter', 'level': 0.8, 'color': Color(0xFF02569B)},
                {'name': 'Dart', 'level': 0.8, 'color': Color(0xFF0175C2)},
                {'name': 'MongoDB', 'level': 0.7, 'color': Color(0xFFFFCA28)},
                {'name': 'Git', 'level': 0.85, 'color': Color(0xFFF05032)},
                {'name': 'REST APIs', 'level': 0.85, 'color': Color(0xFF61DAFB)},
                {'name': 'Provider / Bloc', 'level': 0.7, 'color': Color(0xFF9C27B0)},
                {'name': 'Clean Architecture', 'level': 0.75, 'color': Color(0xFF4CAF50)},
                {'name': 'Figma', 'level': 0.7, 'color': Color(0xFFF24E1E)},
              ],
            ),
            SizedBox(height: 30),
            _buildSkillSection(
              'Habilidades Blandas',
              Icons.psychology,
              Color(0xFFFF6B6B),
              [
                {'name': 'Comunicación', 'level': 0.9, 'color': Color(0xFFE91E63)},
                {'name': 'Trabajo en equipo', 'level': 0.95, 'color': Color(0xFF3F51B5)},
                {'name': 'Resolución de problemas', 'level': 0.85, 'color': Color(0xFFFF9800)},
                {'name': 'Creatividad', 'level': 0.9, 'color': Color(0xFF9C27B0)},
                {'name': 'Organización', 'level': 0.8, 'color': Color(0xFF009688)},
                {'name': 'Atención al detalle', 'level': 0.9, 'color': Color(0xFF795548)},
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillSection(
    String title,
    IconData icon,
    Color accentColor,
    List<Map<String, dynamic>> skills,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ...skills.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> skill = entry.value;
            
            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: skill['level']),
              duration: Duration(milliseconds: 1000 + (index * 200)),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            skill['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4A5568),
                            ),
                          ),
                          Text(
                            '${(value * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: skill['color'],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7 * value,
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    skill['color'].withOpacity(0.8),
                                    skill['color'],
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: skill['color'].withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}