import 'package:flutter/material.dart';
import '../models/cv_data.dart';

class CvRepository {
  static const CvData _cvData = CvData(
    name: 'AHMED YOUSSEF',
    initials: 'AY',
    title: 'Flutter Developer',
    summary:
        'Junior Mobile Developer specializing in Flutter. Skilled in MVVM, state management (Cubit/Provider/Bloc), and backend integration with Firebase. Focused on building responsive, user-friendly apps.',
    about:
        'Write a concise summary about your background, strengths, and what you are passionate about. This section should quickly communicate who you are and what you do.',
    skills: [
      'Flutter',
      'Dart',
      'Bloc',
      'Provider',
      'Cubit',
      'Firebase',
      'REST APIs',
      'State Management',
      'CI/CD',
      'Git',
    ],
    programmingLanguages: [
      ProgrammingLanguage(name: 'Dart', icon: Icons.code),
      ProgrammingLanguage(name: 'Python', icon: Icons.code),
      ProgrammingLanguage(name: 'Java', icon: Icons.coffee),
    ],
    mobileDevelopment: [
      MobileDevelopmentCategory(
        name: 'Framework',
        items: [
          MobileDevelopmentItem(name: 'Flutter', icon: Icons.flutter_dash),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'State Management',
        items: [
          MobileDevelopmentItem(name: 'Bloc', icon: Icons.widgets),
          MobileDevelopmentItem(name: 'Provider', icon: Icons.layers),
          MobileDevelopmentItem(name: 'Cubit', icon: Icons.view_module),
          MobileDevelopmentItem(name: 'GetX', icon: Icons.get_app),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Networking',
        items: [
          MobileDevelopmentItem(name: 'Dio', icon: Icons.hub),
          MobileDevelopmentItem(name: 'HTTP', icon: Icons.http),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Local Storage',
        items: [
          MobileDevelopmentItem(name: 'SQLite', icon: Icons.storage),
          MobileDevelopmentItem(name: 'Hive', icon: Icons.inventory_2),
          MobileDevelopmentItem(name: 'Shared Preferences', icon: Icons.settings_suggest),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Backend Services',
        items: [
          MobileDevelopmentItem(name: 'Firebase', icon: Icons.local_fire_department),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Maps & Location',
        items: [
          MobileDevelopmentItem(name: 'Google Maps', icon: Icons.map),
          MobileDevelopmentItem(name: 'Google Places', icon: Icons.place),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Third Party Services',
        items: [
          MobileDevelopmentItem(name: 'Branch.io', icon: Icons.account_tree),
          MobileDevelopmentItem(name: 'Sentry', icon: Icons.bug_report),
        ],
      ),
    ],
    tools: [
      ToolCategory(
        name: 'Version Control',
        items: [
          ToolItem(name: 'Git', icon: Icons.source),
          ToolItem(name: 'GitHub', icon: Icons.code),
        ],
      ),
      ToolCategory(
        name: 'IDEs',
        items: [
          ToolItem(name: 'VS Code', icon: Icons.code),
          ToolItem(name: 'Android Studio', icon: Icons.android),
        ],
      ),
      ToolCategory(
        name: 'Design & Collaboration',
        items: [
          ToolItem(name: 'Figma', icon: Icons.design_services),
          ToolItem(name: 'Jira', icon: Icons.dashboard),
          ToolItem(name: 'Slack', icon: Icons.chat),
          ToolItem(name: 'Zeplin', icon: Icons.palette),
          ToolItem(name: 'Notion', icon: Icons.note),
        ],
      ),
    ],
    softwareEngineering: [
      SoftwareEngineeringItem(name: 'Data Structures', icon: Icons.account_tree_outlined),
      SoftwareEngineeringItem(name: 'Algorithms', icon: Icons.show_chart),
      SoftwareEngineeringItem(name: 'Design Patterns', icon: Icons.extension),
      SoftwareEngineeringItem(name: 'SOLID Principles', icon: Icons.view_in_ar),
      SoftwareEngineeringItem(name: 'OOP', icon: Icons.category),
      SoftwareEngineeringItem(name: 'Problem Solving', icon: Icons.lightbulb_outline),
    ],
    currentlyLearning: [],
    experiences: [
      Experience(
        role: 'Junior Flutter Developer',
        company: 'Focal Point (Saudi Company, Remote)',
        period: '2023 – 2025 • Full-time',
        description:
            'Formulated and implemented detailed marketing strategies supporting business goals. Guided and oversaw a dynamic team, promoting innovation and performance-driven results. Successfully promoted the brand across all mediums and channels.',
      ),
      Experience(
        role: 'Intern Flutter Developer',
        company: 'Sintacode',
        period: '2023 • Full-time',
        description:
            'Contributed to real-world engineering tasks, gaining practical experience in Flutter and backend integrations. Assisted in debugging, UI improvements, and API handling.',
      ),
      Experience(
        role: 'Hackathon Participant',
        company: 'Orange Digital Center Egypt',
        period: '2024 – 2025',
        description:
            'Built and presented a prototype mobile app under time constraints, showcasing problem-solving and teamwork skills.',
      ),
    ],
    projects: [
      Project(
        name: 'Jeras & Dream / Make My Nekhal (Play Store / app Store)',
        description:
            'Two production-level mobile apps developed and continuously updated for a Saudi company (remote). Implemented MVVM, SOLID, Cubit, authentication, and Firebase storage. Integrated Google APIs and Firestore.',
        tags: ['Flutter', 'MVVM', 'Cubit', 'SOLID', 'Firebase', 'Google APIs'],
      ),
      Project(
        name: 'Medical App',
        description:
            'Appointments system with dashboards and analytics for users and doctors. Frontend in Flutter; backend in PHP.',
        tags: ['Flutter', 'PHP', 'CRUD', 'Analytics'],
      ),
      Project(
        name: 'Vegi App (E-commerce)',
        description:
            'Client purchases and admin product management with payment, authentication, and shopping cart flows.',
        tags: ['Flutter', 'Provider', 'MVVM', 'E-commerce'],
      ),
      Project(
        name: 'Todo App (SQLite + Firebase)',
        description:
            'Note-taking app with Firebase authentication (Google sign-in) and dual storage using SQLite.',
        tags: ['Flutter', 'SQLite', 'Firebase', 'Bloc', 'Widgets'],
      ),
    ],
    email: 'ay3220187@gmail.com',
    phone: '+20114431832',
    location: 'Cairo, Egypt',
    socials: {
      'GitHub': 'https://github.com/ahmedyoussef352',
      'LinkedIn': 'https://www.linkedin.com/in/ahmed-youssef-606752327',
    },
  );

  static CvData getCvData() => _cvData;
}
