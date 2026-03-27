import 'package:flutter/material.dart';

class CvData {
  final String name;
  final String initials;
  final String title;
  final String summary;
  final List<String> skills;
  final List<ProgrammingLanguage> programmingLanguages;
  final List<MobileDevelopmentCategory> mobileDevelopment;
  final List<ToolCategory> tools;
  final List<SoftwareEngineeringItem> softwareEngineering;
  final List<LearningItem> currentlyLearning;
  final List<Experience> experiences;
  final List<Project> projects;
  final String email;
  final String phone;
  final String location;
  final Map<String, String> socials;

  const CvData({
    required this.name,
    required this.initials,
    required this.title,
    required this.summary,
    required this.skills,
    required this.programmingLanguages,
    required this.mobileDevelopment,
    required this.tools,
    required this.softwareEngineering,
    required this.currentlyLearning,
    required this.experiences,
    required this.projects,
    required this.email,
    required this.phone,
    required this.location,
    required this.socials,
  });
}

class ProgrammingLanguage {
  final String name;
  final IconData icon;
  const ProgrammingLanguage({required this.name, required this.icon});
}

class MobileDevelopmentCategory {
  final String name;
  final List<MobileDevelopmentItem> items;
  const MobileDevelopmentCategory({required this.name, required this.items});
}

class MobileDevelopmentItem {
  final String name;
  final IconData icon;
  const MobileDevelopmentItem({required this.name, required this.icon});
}

class ToolCategory {
  final String name;
  final List<ToolItem> items;
  const ToolCategory({required this.name, required this.items});
}

class ToolItem {
  final String name;
  final IconData icon;
  const ToolItem({required this.name, required this.icon});
}

class SoftwareEngineeringItem {
  final String name;
  final IconData icon;
  const SoftwareEngineeringItem({required this.name, required this.icon});
}

class LearningItem {
  final String name;
  final IconData icon;
  const LearningItem({required this.name, required this.icon});
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String description;
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });
}

class Project {
  final String name;
  final String logo;
  final String description;
  final List<String> tags;
  final List<String>? images;
  final String link;
  const Project({
    required this.name,
    required this.logo,
    required this.description,
    required this.tags,
    this.images,
    required this.link
  });
}
