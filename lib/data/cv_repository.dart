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
          MobileDevelopmentItem(
            name: 'Shared Preferences',
            icon: Icons.settings_suggest,
          ),
        ],
      ),
      MobileDevelopmentCategory(
        name: 'Backend Services',
        items: [
          MobileDevelopmentItem(
            name: 'Firebase',
            icon: Icons.local_fire_department,
          ),
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
      SoftwareEngineeringItem(
        name: 'Data Structures',
        icon: Icons.account_tree_outlined,
      ),
      SoftwareEngineeringItem(name: 'Algorithms', icon: Icons.show_chart),
      SoftwareEngineeringItem(name: 'Design Patterns', icon: Icons.extension),
      SoftwareEngineeringItem(name: 'SOLID Principles', icon: Icons.view_in_ar),
      SoftwareEngineeringItem(name: 'OOP', icon: Icons.category),
      SoftwareEngineeringItem(
        name: 'Problem Solving',
        icon: Icons.lightbulb_outline,
      ),
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
        images: [
          "assets/images/jeras_slides/1.jpeg",
          "assets/images/jeras_slides/2.jpeg",
          "assets/images/jeras_slides/3.jpeg",
          "assets/images/jeras_slides/4.jpeg",
          "assets/images/jeras_slides/5.jpeg",
          "assets/images/jeras_slides/6.jpeg",
        ],
        logo: "assets/images/jeras.png",
        name: 'Jeras - Quran - Islamic Values (Play Store / app Store)',
        description:
            'Are you a parent looking to impart Islamic values to your children in a fun and interactive way? Look no further! Jeras app is the ideal solution for you and your family. With Jeras, you can create a personalized learning experience for your children, helping them learn about Islam through engaging activities and interactive content. Whether you want to teach them about the Quran, Islamic history, or important values, Jeras has got you covered. Download Jeras today and start nurturing your child’s Islamic education in an enjoyable and meaningful way.',
        tags: [
          'Flutter',
          'Responsive UI',
          'MVVM',
          'Cubit',
          'SOLID',
          'Firebase',
          'Google APIs',
        ],
      ),
      Project(
        images: [
          "assets/images/dream_slides/1.jpeg",
          "assets/images/dream_slides/2.jpeg",
          "assets/images/dream_slides/3.jpeg",
          "assets/images/dream_slides/4.jpeg",
          "assets/images/dream_slides/5.jpeg",
          "assets/images/dream_slides/6.jpeg",
          "assets/images/dream_slides/7.jpeg",
          "assets/images/dream_slides/8.jpeg",
        ],
        logo: "assets/images/dream_logo.png",
        name: 'Dream – Dream interpretation (Play Store / app Store)',
        description:
            'Start your journey of self-discovery with the Dream app, Dream App is a specialized mobile platform that connects users with expert consultants for personalized dream interpretation. It offers a seamless experience through private voice calls, secure messaging, and a robust booking system. With multilingual support and integrated digital payments, it provides a professional and confidential environment for users to uncover the meanings behind their dreams.',
        tags: ['Flutter', 'MVVM', 'Cubit', 'SOLID', 'Firebase', 'Google APIs'],
      ),
      Project(
        images: [
          "assets/images/mmn_slides/1.jpeg",
          "assets/images/mmn_slides/2.jpeg",
          "assets/images/mmn_slides/3.jpeg",
          "assets/images/mmn_slides/4.jpeg",
          "assets/images/mmn_slides/5.jpeg",
          "assets/images/mmn_slides/6.jpeg",
          "assets/images/mmn_slides/7.jpeg",
          "assets/images/mmn_slides/8.jpeg",
        ],
        logo: "assets/images/makemynikah.png",
        name: 'MakeMyNikah (Play Store / app Store)',
        description:
            'Welcome to Make My Nikah, the premier Islamic marriage app dedicated to fostering beautiful and everlasting unions under the guidance of Islam. Founded and endorsed by respected Islamic scholars and renowned callers to Islam, our app is designed not just to connect you with a compatible Muslim spouse but to enrich your journey towards a fulfilling married life. With a user-friendly interface and a commitment to Islamic values, Make My Nikah is your trusted companion in finding love and building a strong foundation for your future together.',
        tags: ['Flutter', 'MVVM', 'Cubit', 'SOLID', 'Firebase', 'Google APIs'],
      ),
      Project(
        images: [
          "assets/images/medical_slides/11.jpeg",
          "assets/images/medical_slides/10.jpeg",
          "assets/images/medical_slides/9.jpeg",
          "assets/images/medical_slides/8.jpeg",
          "assets/images/medical_slides/7.jpeg",
          "assets/images/medical_slides/6.jpeg",
          "assets/images/medical_slides/5.jpeg",
          "assets/images/medical_slides/4.jpeg",
          "assets/images/medical_slides/3.jpeg",
          "assets/images/medical_slides/1.jpeg",
          "assets/images/medical_slides/2.jpeg",
        ],
        logo: "assets/images/medical_app.jpg",
        name: 'Medical App',
        description:
            'DOC Spot is a specialized healthcare platform that connects patients with medical specialists. The app enables users to filter doctors by specialty—such as Pediatricians or Neurosurgeons—view professional credentials, and manage appointment bookings or reschedules through a simplified mobile interface.',
        tags: ['Flutter','Clean Architecture', 'Api','PHP', 'CRUD', 'Analytics'],
      ),
      Project(
        images: [
          "assets/images/vegi_slides/12.jpeg",
          "assets/images/vegi_slides/11.jpeg",
          "assets/images/vegi_slides/10.jpeg",
          "assets/images/vegi_slides/9.jpeg",
          "assets/images/vegi_slides/8.jpeg",
          "assets/images/vegi_slides/7.jpeg",
          "assets/images/vegi_slides/6.jpeg",
          "assets/images/vegi_slides/5.jpeg",
          "assets/images/vegi_slides/4.jpeg",
          "assets/images/vegi_slides/3.jpeg",
          "assets/images/vegi_slides/2.jpeg",
          "assets/images/vegi_slides/1.jpeg",
        ],
        logo: "assets/images/vegi_app.png",
        name: 'Vegi App (E-commerce)',
        description:
            'Vegi is a cross-platform e-commerce mobile application designed for seamless shopping and delivery. While the branding suggests a focus on fresh produce, the platform serves as a versatile marketplace featuring diverse categories including groceries, high-end electronics (smartphones and tablets), and cosmetics.',
        tags: ['Flutter','Clean Architecture','Firebase', 'Provider', 'MVVM', 'E-commerce'],
      ),
    ],
    email: 'ay3220187@gmail.com',
    phone: '+201095192300',
    location: 'Cairo, Egypt',
    socials: {
      'GitHub': 'https://github.com/ahmedyoussef352',
      'LinkedIn': 'https://www.linkedin.com/in/ahmed-youssef-606752327',
    },
  );

  static CvData getCvData() => _cvData;
}
