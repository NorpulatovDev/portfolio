import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ogabek Norpulatov - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E27),
        fontFamily: 'Poppins',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      if (Navigator.canPop(this.context)) {
        Navigator.of(this.context).pop();
      }
    }
  }

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  bool _isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  bool _isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = _isMobile(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          isMobile ? 'ON' : 'Ogabek Norpulatov',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: isMobile
            ? null
            : [
                TextButton(
                  onPressed: () => _scrollToSection(_aboutKey),
                  child: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_skillsKey),
                  child: const Text(
                    'Skills',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_projectsKey),
                  child: const Text(
                    'Projects',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_experienceKey),
                  child: const Text(
                    'Experience',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_educationKey),
                  child: const Text(
                    'Education',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_achievementsKey),
                  child: const Text(
                    'Achievements',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  child: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
              ],
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor: const Color(0xFF1a1f3a),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 60, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'Ogabek Norpulatov',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: const Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_aboutKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.code, color: Colors.blue),
                    title: const Text(
                      'Skills',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_skillsKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.work, color: Colors.blue),
                    title: const Text(
                      'Projects',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_projectsKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.business, color: Colors.blue),
                    title: const Text(
                      'Experience',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_experienceKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.blue),
                    title: const Text(
                      'Education',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_educationKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.emoji_events, color: Colors.blue),
                    title: const Text(
                      'Achievements',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_achievementsKey),
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_mail, color: Colors.blue),
                    title: const Text(
                      'Contact',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _scrollToSection(_contactKey),
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(),
            _buildAboutSection(),
            _buildSkillsSection(),
            _buildProjectsSection(),
            _buildExperienceSection(),
            _buildEducationSection(),
            _buildAchievementsSection(),
            _buildContactSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    final isMobile = _isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate minimum height to prevent overflow
    double minHeight = isMobile ? 500 : 600;
    double calculatedHeight = isMobile ? screenHeight - 60 : screenHeight - 80;

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: calculatedHeight > minHeight ? calculatedHeight : minHeight,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0A0E27),
            const Color(0xFF1a1f3a),
            Colors.blue.shade900.withOpacity(0.3),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 40 : 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: isMobile ? 120 : 170,
                        height: isMobile ? 120 : 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade400,
                                  Colors.purple.shade400,
                                ],
                              ),
                            ),
                            child: _buildProfileImage(isMobile),
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 20 : 30),
                      Text(
                        'Ogabek Norpulatov',
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                        'Freelance Java & Flutter Developer',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 24,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 6 : 8),
                      Text(
                        'Building Scalable Backends & Cross-Platform Mobile Apps',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 30 : 40),
                      isMobile
                          ? Column(
                              children: [
                                _buildSocialButton(
                                  icon: Icons.phone,
                                  label: '+998 97 577 7592',
                                  onTap: () => _launchUrl('tel:+998975777592'),
                                  isMobile: true,
                                ),
                                const SizedBox(height: 12),
                                _buildSocialButton(
                                  icon: Icons.email,
                                  label: 'Email',
                                  onTap: () => _launchUrl(
                                    'mailto:ogabeknorpulatov571@gmail.com',
                                  ),
                                  isMobile: true,
                                ),
                                const SizedBox(height: 12),
                                _buildSocialButton(
                                  icon: Icons.code,
                                  label: 'GitHub',
                                  onTap: () => _launchUrl(
                                    'https://github.com/NorpulatovDev',
                                  ),
                                  isMobile: true,
                                ),
                                const SizedBox(height: 12),
                                _buildSocialButton(
                                  icon: Icons.link,
                                  label: 'LinkedIn',
                                  onTap: () => _launchUrl(
                                    'https://linkedin.com/in/ogabek-norpulatov',
                                  ),
                                  isMobile: true,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialButton(
                                  icon: Icons.phone,
                                  label: '+998 97 577 7592',
                                  onTap: () => _launchUrl('tel:+998975777592'),
                                  isMobile: false,
                                ),
                                const SizedBox(width: 16),
                                _buildSocialButton(
                                  icon: Icons.email,
                                  label: 'Email',
                                  onTap: () => _launchUrl(
                                    'mailto:ogabeknorpulatov571@gmail.com',
                                  ),
                                  isMobile: false,
                                ),
                                const SizedBox(width: 16),
                                _buildSocialButton(
                                  icon: Icons.code,
                                  label: 'GitHub',
                                  onTap: () => _launchUrl(
                                    'https://github.com/NorpulatovDev',
                                  ),
                                  isMobile: false,
                                ),
                                const SizedBox(width: 16),
                                _buildSocialButton(
                                  icon: Icons.link,
                                  label: 'LinkedIn',
                                  onTap: () => _launchUrl(
                                    'https://linkedin.com/in/ogabek-norpulatov',
                                  ),
                                  isMobile: false,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 40 : 60),
                IconButton(
                  onPressed: () => _scrollToSection(_aboutKey),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: isMobile ? 32 : 40,
                  ),
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    final isMobile = _isMobile(context);

    return Container(
      key: _aboutKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 20 : 40),
          Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 800,
            ),
            child: Text(
              'I\'m a software developer who works with Java (Spring Boot) and Flutter. I like building clean, reliable, and easy-to-use applications — both backend systems and mobile apps. '
              'As a freelancer, I\'ve worked on different projects where I built APIs, designed databases, and created mobile app interfaces. I enjoy solving real problems and want to build apps that help people, especially in education and public services. '
              'I always try to write clear and maintainable code and follow good practices like MVC/MVVM architecture, dependency injection, and secure authentication.',
              style: TextStyle(
                fontSize: isMobile ? 14 : 18,
                color: Colors.white70,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 40),
          Wrap(
            spacing: isMobile ? 10 : 20,
            runSpacing: isMobile ? 10 : 20,
            alignment: WrapAlignment.center,
            children: [
              _buildLanguageChip('Uzbek', 'Native', Colors.blue, isMobile),
              _buildLanguageChip(
                'English',
                'Professional Working',
                Colors.green,
                isMobile,
              ),
              _buildLanguageChip('Korean', 'Elementary', Colors.purple, isMobile),
            ],
          ),
          SizedBox(height: isMobile ? 30 : 40),
          // Certifications Section
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.green.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: isMobile ? 32 : 40,
                ),
                SizedBox(height: isMobile ? 12 : 16),
                Text(
                  'Certified',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 12),
                Text(
                  'Flutter & Dart - The Complete Guide [2023 Edition]',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    final isMobile = _isMobile(context);
    final isTablet = _isTablet(context);

    return Container(
      key: _skillsKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0A0E27),
            Colors.blue.shade900.withOpacity(0.1),
            const Color(0xFF0A0E27),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = isMobile
                  ? constraints.maxWidth - 40
                  : (isTablet ? 280 : 280);

              return Wrap(
                spacing: isMobile ? 0 : 30,
                runSpacing: isMobile ? 20 : 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildSkillCard(
                    'Backend',
                    ['Java', 'Spring Boot', 'REST APIs', 'JPA/Hibernate'],
                    Icons.computer,
                    Colors.blue,
                    cardWidth,
                  ),
                  _buildSkillCard(
                    'Mobile',
                    ['Dart', 'Flutter', 'Riverpod', 'Bloc', 'Dio', 'Firebase'],
                    Icons.phone_android,
                    Colors.green,
                    cardWidth,
                  ),
                  _buildSkillCard(
                    'Databases',
                    ['PostgreSQL', 'MySQL', 'SQLite'],
                    Icons.storage,
                    Colors.orange,
                    cardWidth,
                  ),
                  _buildSkillCard(
                    'Tools & APIs',
                    ['Git', 'Docker', 'Postman', 'Swagger API', 'IntelliJ IDEA', 'VS Code'],
                    Icons.build,
                    Colors.purple,
                    cardWidth,
                  ),
                  _buildSkillCard(
                    'Architecture',
                    ['MVC', 'MVVM', 'Dependency Injection', 'JWT Authentication'],
                    Icons.architecture,
                    Colors.pink,
                    cardWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    final isMobile = _isMobile(context);
    final isTablet = _isTablet(context);

    return Container(
      key: _projectsKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Column(
        children: [
          Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = isMobile
                  ? constraints.maxWidth - 40
                  : (isTablet ? constraints.maxWidth / 2 - 40 : 350);

              return Wrap(
                spacing: isMobile ? 0 : 30,
                runSpacing: isMobile ? 20 : 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildProjectCard(
                    'EduNova LMS',
                    'Learning Management System',
                    'Learning Management System built with Spring Boot + PostgreSQL. Features authentication (JWT), RESTful APIs for teachers, students, reports. Future-ready backend for an education platform.',
                    ['Spring Boot', 'PostgreSQL', 'JWT', 'REST API'],
                    Colors.blue,
                    cardWidth,
                    'https://github.com/NorpulatovDev/edunova',
                  ),
                  _buildProjectCard(
                    'iStudy LMS Backend',
                    'Learning Management System Backend',
                    'A Learning Management System (LMS) backend built with Spring Boot to manage courses, students, and teachers. Role-based authentication with clean architecture principles.',
                    ['Spring Boot', 'PostgreSQL', 'JWT', 'Clean Architecture'],
                    Colors.green,
                    cardWidth,
                    'https://github.com/NorpulatovDev/iStudy',
                  ),
                  _buildProjectCard(
                    'iStudy LMS Mobile',
                    'Flutter LMS Client App',
                    'Flutter-based LMS client app for students and teachers to access learning materials on mobile and web platforms. Built with MVVM architecture and Riverpod for state management.',
                    ['Flutter', 'Dart', 'Bloc', 'MVVM', 'Riverpod'],
                    Colors.purple,
                    cardWidth,
                    'https://github.com/NorpulatovDev/iStudyMobile',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    final isMobile = _isMobile(context);

    return Container(
      key: _experienceKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0A0E27),
            Colors.green.shade900.withOpacity(0.1),
            const Color(0xFF0A0E27),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          _buildExperienceItem(
            'Freelancing',
            'Freelance Web Developer',
            'June 2024 - Present',
            'Samarkand, Uzbekistan',
            'Created more than 3 real projects. Building Backend and Frontend projects with Spring Boot and Flutter.',
            Colors.blue,
            isMobile,
          ),
          SizedBox(height: isMobile ? 24 : 32),
          _buildExperienceItem(
            'Smart Software',
            'Mobile Developer (Internship)',
            'June 2023 - July 2023',
            'Tashkent, Uzbekistan',
            'Worked as a mobile developer for internship during a month. Left due to lack of knowledge around the team and limited learning opportunities.',
            Colors.orange,
            isMobile,
          ),
          SizedBox(height: isMobile ? 24 : 32),
          _buildExperienceItem(
            'Codeschool IT Academy',
            'Mobile Developer & Assistant Teacher',
            'January 2023 - May 2023',
            'Samarqand Region, Uzbekistan',
            'Worked as an assistant teacher and as a mobile developer, helping students learn mobile development while gaining practical experience.',
            Colors.purple,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    final isMobile = _isMobile(context);

    return Container(
      key: _educationKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Column(
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          _buildEducationItem(
            'Seojeong College',
            'Bachelor\'s degree, Tourism and Travel Services Management',
            'September 2024 - May 2025',
            Colors.blue,
            isMobile,
          ),
          SizedBox(height: isMobile ? 24 : 32),
          _buildEducationItem(
            'Samarkand Institute of Economics and Service',
            'Bachelor\'s degree, Economics',
            'September 2023 - May 2024',
            Colors.green,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection() {
    final isMobile = _isMobile(context);

    return Container(
      key: _achievementsKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0A0E27),
            Colors.purple.shade900.withOpacity(0.1),
            const Color(0xFF0A0E27),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Achievements & Problem Solving',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          isMobile
              ? Column(
                  children: [
                    _buildAchievementCard(
                      '600+',
                      'Codewars Problems',
                      Icons.emoji_events,
                      Colors.amber,
                      isMobile,
                      () => _launchUrl('https://www.codewars.com/users/norpulatovogabek'),
                    ),
                    const SizedBox(height: 20),
                    _buildAchievementCard(
                      '50+',
                      'LeetCode Problems',
                      Icons.psychology,
                      Colors.orange,
                      isMobile,
                      () => _launchUrl('https://leetcode.com/ogabek005'),
                    ),
                    const SizedBox(height: 20),
                    _buildAchievementCard(
                      '3+',
                      'Real Projects Delivered',
                      Icons.check_circle,
                      Colors.green,
                      isMobile,
                      null,
                    ),
                    const SizedBox(height: 20),
                    _buildAchievementCard(
                      '1+',
                      'Years of Freelancing',
                      Icons.work,
                      Colors.blue,
                      isMobile,
                      null,
                    ),
                  ],
                )
              : Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildAchievementCard(
                      '600+',
                      'Codewars Problems',
                      Icons.emoji_events,
                      Colors.amber,
                      isMobile,
                      () => _launchUrl('https://www.codewars.com/users/norpulatovogabek'),
                    ),
                    _buildAchievementCard(
                      '50+',
                      'LeetCode Problems',
                      Icons.psychology,
                      Colors.orange,
                      isMobile,
                      () => _launchUrl('https://leetcode.com/ogabek005'),
                    ),
                    _buildAchievementCard(
                      '3+',
                      'Real Projects Delivered',
                      Icons.check_circle,
                      Colors.green,
                      isMobile,
                      null,
                    ),
                    _buildAchievementCard(
                      '1+',
                      'Years of Freelancing',
                      Icons.work,
                      Colors.blue,
                      isMobile,
                      null,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    final isMobile = _isMobile(context);

    return Container(
      key: _contactKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 20 : 40),
          Text(
            'I\'m open to freelance projects, team collaborations, and full-time roles where I can create useful and high-quality software.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 40),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = isMobile ? constraints.maxWidth - 40 : 300;

              return Wrap(
                spacing: isMobile ? 0 : 20,
                runSpacing: isMobile ? 15 : 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildContactCard(
                    Icons.phone,
                    'Phone',
                    '+998 97 577 7592',
                    () => _launchUrl('tel:+998975777592'),
                    cardWidth,
                  ),
                  _buildContactCard(
                    Icons.email,
                    'Email',
                    'ogabeknorpulatov571@gmail.com',
                    () => _launchUrl('mailto:ogabeknorpulatov571@gmail.com'),
                    cardWidth,
                  ),
                  _buildContactCard(
                    Icons.code,
                    'GitHub',
                    'github.com/NorpulatovDev',
                    () => _launchUrl('https://github.com/NorpulatovDev'),
                    cardWidth,
                  ),
                  _buildContactCard(
                    Icons.link,
                    'LinkedIn',
                    'linkedin.com/in/ogabeknorpulatov',
                    () => _launchUrl('https://linkedin.com/in/ogabeknorpulatov'),
                    cardWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final isMobile = _isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.purple.shade900],
        ),
      ),
      child: Center(
        child: Text(
          '© 2024 Ogabek Norpulatov. Built with Flutter ❤️',
          style: TextStyle(color: Colors.white70, fontSize: isMobile ? 12 : 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: isMobile ? 18 : 20),
        label: Text(label, style: TextStyle(fontSize: isMobile ? 14 : 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 24,
            vertical: isMobile ? 14 : 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageChip(
    String language,
    String level,
    Color color,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 20,
        vertical: isMobile ? 10 : 12,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          Text(
            language,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            level,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 10 : 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
    String title,
    List<String> skills,
    IconData icon,
    Color color,
    double width,
  ) {
    final isMobile = _isMobile(context);

    return Container(
      width: width,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Icon(icon, size: isMobile ? 40 : 48, color: color),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                skill,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 13 : 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String subtitle,
    String description,
    List<String> tech,
    Color color,
    double width,
    String? githubUrl,
  ) {
    final isMobile = _isMobile(context);

    return Container(
      width: width,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.2), color.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              if (githubUrl != null)
                IconButton(
                  onPressed: () => _launchUrl(githubUrl),
                  icon: Icon(Icons.open_in_new, color: color, size: 20),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
              fontSize: isMobile ? 13 : 14,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map(
                  (t) => Chip(
                    label: Text(
                      t,
                      style: TextStyle(fontSize: isMobile ? 10 : 12),
                    ),
                    backgroundColor: color.withOpacity(0.3),
                    padding: EdgeInsets.zero,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    String company,
    String position,
    String duration,
    String location,
    String description,
    Color color,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            position,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$duration • $location',
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(
    String institution,
    String degree,
    String duration,
    Color color,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.school, color: color, size: isMobile ? 32 : 40),
          SizedBox(width: isMobile ? 16 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institution,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(
    String number,
    String label,
    IconData icon,
    Color color,
    bool isMobile,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isMobile ? double.infinity : 250,
        padding: EdgeInsets.all(isMobile ? 24 : 32),
        margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: isMobile ? 48 : 64, color: color),
            SizedBox(height: isMobile ? 12 : 16),
            Text(
              number,
              style: TextStyle(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: isMobile ? 6 : 8),
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            if (onTap != null) ...[
              const SizedBox(height: 8),
              Icon(
                Icons.open_in_new,
                size: 16,
                color: Colors.white54,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    IconData icon,
    String title,
    String value,
    VoidCallback onTap,
    double width,
  ) {
    final isMobile = _isMobile(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: isMobile ? 28 : 32),
            SizedBox(width: isMobile ? 12 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isMobile ? 11 : 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(bool isMobile) {
    // Option 1: Use network image (if you have an online image URL)
    return Image.network(
      'https://avatars.githubusercontent.com/u/186775495?s=400&u=e3d0a3f1e37ee44f1885c7f8d186b359fcce9da2&v=4',
      width: isMobile ? 120 : 170,
      height: isMobile ? 120 : 170,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildFallbackAvatar(isMobile),
    );
    
    // Option 2: Use asset image (recommended)
    // return Image.asset(
    //   'assets/images/me_without_background.jpg', // Put your image here
    //   width: isMobile ? 120 : 170,
    //   height: isMobile ? 120 : 170,
    //   fit: BoxFit.cover,
    //   errorBuilder: (context, error, stackTrace) => _buildFallbackAvatar(isMobile),
    // );
  }

  Widget _buildFallbackAvatar(bool isMobile) {
    return Container(
      width: isMobile ? 120 : 170,
      height: isMobile ? 120 : 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.purple.shade400,
          ],
        ),
      ),
      child: Icon(
        Icons.person,
        size: isMobile ? 60 : 85,
        color: Colors.white,
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}