import 'package:flutter/material.dart';
import '../widgets/custom_app_header.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late List<AnimationController> _cardControllers;

  final List<Map<String, dynamic>> educationData = [
    {
      'title': 'Desarrollo de sistemas e información',
      'institution': 'IESTP San Pedro del valle de mala',
      'period': '2017 - 2019',
      'type': 'Pregrado',
      'description': 'Formación integral en desarrollo de software, bases de datos, arquitectura de sistemas y metodologías ágiles.',
      'color': Color(0xFF3B82F6),
      'icon': Icons.school,
      'status': 'Completado',
    },
    {
      'title': 'Máster en PHP 8, POO, MVC, MySQL, Laravel 8, CodeIgniter 4',
      'institution': 'UDEMY (curso online)',
      'period': '2023(6 meses)',
      'type': 'Certificación',
      'description': 'Certificación avanzada en desarrollo backend y frontend con PHP 8, programación orientada a objetos, patrones MVC, gestión de bases de datos MySQL y frameworks modernos como Laravel 8 y CodeIgniter 4.',
      'color': Color(0xFF10B981),
      'icon': Icons.verified,
      'status': 'Certificado',
    },
    {
      'title': 'Curso Profesional de Git y GitHub',
      'institution': 'PLATZI (curso online)',
      'period': '2023',
      'type': 'Certificación',
     'description': 'Certificación profesional en control de versiones con Git y gestión de proyectos colaborativos en GitHub, incluyendo ramas, pull requests, flujos de trabajo y buenas prácticas para el desarrollo de software.',
      'color': Color(0xFFFF6B6B),
      'icon': Icons.cloud,
      'status': 'Certificado',
    },
   
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _cardControllers = List.generate(
      educationData.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    _controller.forward();
    _animateCards();
  }

  void _animateCards() async {
    for (int i = 0; i < _cardControllers.length; i++) {
      await Future.delayed(Duration(milliseconds: 150));
      _cardControllers[i].forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
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
               CustomAppHeader(
              title: 'Educación',
              subtitle: 'Formación académica y certificaciones',
            ),
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


  Widget _buildContent() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            _buildStatsCard(),
            SizedBox(height: 30),
            ...educationData.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> education = entry.value;
              
              return _buildEducationCard(
                education,
                index,
                _cardControllers[index],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
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
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.school_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formación Académica',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    Text(
                      'Aprendizaje continuo y especialización',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  '1',
                  'Título\nUniversitario',
                  Color(0xFF3B82F6),
                  Icons.school,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '3',
                  'Certificaciones\nTécnicas',
                  Color(0xFF10B981),
                  Icons.verified,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  '5+',
                  'Años de\nEstudio',
                  Color(0xFFFF6B6B),
                  Icons.timeline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          SizedBox(height: 8),
          Text(
            number,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF4A5568),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(
    Map<String, dynamic> education,
    int index,
    AnimationController controller,
  ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * controller.value),
          child: Opacity(
            opacity: controller.value,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
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
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: education['color'],
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: education['color'].withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          education['icon'],
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              education['title'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              education['institution'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: education['color'],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(education['status']).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          education['status'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(education['status']),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: education['color'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          education['type'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: education['color'],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Color(0xFF718096),
                            ),
                            SizedBox(width: 4),
                            Text(
                              education['period'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF718096),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    education['description'],
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF4A5568),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completado':
        return Color(0xFF10B981);
      case 'Certificado':
        return Color(0xFF3B82F6);
      default:
        return Color(0xFF6B7280);
    }
  }
}