import 'package:flutter/material.dart';

class ExperienceScreen extends StatefulWidget {
  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late List<AnimationController> _cardControllers;

  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Flutter Developer',
      'company': 'Blue Media',
      'period': '2023 - Presente',
      'description': 'Desarrollo de aplicaciones móviles y web a partir de prototipos en Figma, transformando diseños en código funcional y responsivo. Especializada en frontend con Flutter, pero también implemento lógica de negocio y gestión de estados con Bloc para una experiencia completa.',
      'color': Color(0xFF02569B),
      'icon': Icons.smartphone,
      'current': true,
    },
    {
      'title': 'Full Stack Developer junior (MongoDB, Express, Vue.js)',
      'company': 'Ares revisiones técnicas vehiculares',
      'period': '2022 - 2023',
      'description': 'Desarrollé funcionalidades full stack, gestionando bases de datos en MongoDB, creando y administrando rutas y APIs REST con Express, y construyendo interfaces interactivas con Vue.js. Encargado de la integración entre frontend y backend, así como del modelado de datos y operaciones CRUD',
      'color': Color(0xFF4CAF50),
      'icon': Icons.code,
      'current': false,
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
      experiences.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 800),
        vsync: this,
      ),
    );

    _controller.forward();
    _animateCards();
  }

  void _animateCards() async {
    for (int i = 0; i < _cardControllers.length; i++) {
      await Future.delayed(Duration(milliseconds: 200));
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experiencia',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Mi trayectoria profesional',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
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
          children: [
            _buildTimelineHeader(),
            SizedBox(height: 30),
            ...experiences.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> experience = entry.value;
              
              return _buildExperienceCard(
                experience,
                index,
                _cardControllers[index],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF6B6B), Color(0xFFFFE66D)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.work_history,
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
                  'Experiencia Laboral',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                Text(
                  '3+ años desarrollando con Flutter',
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
    );
  }

  Widget _buildExperienceCard(
    Map<String, dynamic> experience,
    int index,
    AnimationController controller,
  ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - controller.value)),
          child: Opacity(
            opacity: controller.value,
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Stack(
                children: [
                  // Timeline line
                  if (index < experiences.length - 1)
                    Positioned(
                      left: 25,
                      top: 80,
                      bottom: -24,
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              experience['color'].withOpacity(0.3),
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  
                  // Main card
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timeline dot
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: experience['color'],
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: experience['color'].withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(
                                experience['icon'],
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            if (experience['current'])
                              Positioned(
                                top: -2,
                                right: -2,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF10B981),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      
                      // Card content
                      Expanded(
                        child: Container(
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          experience['title'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2D3748),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          experience['company'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: experience['color'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (experience['current'])
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF10B981).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Actual',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF10B981),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: experience['color'].withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  experience['period'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: experience['color'],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                experience['description'],
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}