import 'package:flutter/material.dart';
import '../models/experience.dart';
import '../models/project.dart';
import '../models/service.dart';
import '../models/skill.dart';
import 'project_images.dart';

class PortfolioData {
  // Personal Information
  static const String name = 'Desh Bala';
  static const String role = 'Flutter Developer';
  static const String email = 'deshbala999@gmail.com';
  static const String phone = '+8801935656149';
  static const String location = 'Bangladesh';

  // Profile Image (base64 or asset path)
  static const String? profileImagePath = 'assets/images/profile.jpg';

  // Social Links
  static const String? githubUrl = null; // Add your GitHub URL
  static const String? linkedinUrl = null; // Add your LinkedIn URL
  static const String? twitterUrl = null; // Add your Twitter URL

  // About Me
  static const String aboutMe =
      'Passionate Flutter Developer with 2+ years of experience in building '
      'high-performance, cross-platform Android and iOS applications. '
      'Skilled in Dart, State Management (GetX, BLoC), REST APIs, Firebase, '
      'and UI/UX design integration. Proven ability to deliver clean, '
      'scalable code and seamless user experiences.';

  static const String aboutMeDetailed =
      'I specialize in creating beautiful, responsive mobile applications '
      'that work seamlessly across platforms. My expertise includes modern '
      'Flutter development, clean architecture, efficient state management, '
      'and integrating backend services. I\'m passionate about writing '
      'maintainable code and creating intuitive user experiences that delight users.';

  // Skills organized by category
  static const List<Skill> skills = [
    // Core Technologies
    Skill(name: 'Flutter', proficiency: 0.95, category: 'Core'),
    Skill(name: 'Dart', proficiency: 0.95, category: 'Core'),

    // State Management
    Skill(
      name: 'BLoC Pattern',
      proficiency: 0.85,
      category: 'State Management',
    ),
    Skill(name: 'GetX', proficiency: 0.90, category: 'State Management'),

    // Backend & APIs
    Skill(name: 'REST API Integration', proficiency: 0.90, category: 'Backend'),
    Skill(name: 'JSON Parsing', proficiency: 0.90, category: 'Backend'),
    Skill(name: 'Firebase', proficiency: 0.85, category: 'Backend'),

    // Firebase Services
    Skill(name: 'Firebase Auth', proficiency: 0.90, category: 'Firebase'),
    Skill(name: 'Cloud Firestore', proficiency: 0.85, category: 'Firebase'),
    Skill(name: 'Firebase Storage', proficiency: 0.85, category: 'Firebase'),
    Skill(
      name: 'FCM (Push Notifications)',
      proficiency: 0.80,
      category: 'Firebase',
    ),

    // Local Storage
    Skill(name: 'SharedPreferences', proficiency: 0.90, category: 'Storage'),
    Skill(name: 'Hive', proficiency: 0.75, category: 'Storage'),

    // Tools & Architecture
    Skill(
      name: 'Clean Architecture',
      proficiency: 0.85,
      category: 'Architecture',
    ),
    Skill(name: 'Git & GitHub', proficiency: 0.85, category: 'Tools'),
    Skill(name: 'Material Design', proficiency: 0.90, category: 'UI/UX'),
    Skill(name: 'Responsive Design', proficiency: 0.90, category: 'UI/UX'),

    // Additional Technologies
    Skill(name: 'Google Maps API', proficiency: 0.85, category: 'APIs'),
    Skill(
      name: 'Payment Gateway Integration',
      proficiency: 0.75,
      category: 'APIs',
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'E-Commerce Mobile App',
      description:
          'Built a full-featured shopping app with Flutter & Firebase. '
          'Integrated payment gateway and real-time order tracking.',
      technologies: ['Flutter', 'Firebase', 'BLoC', 'Payment Gateway'],
      imageUrl: ProjectImages.ecommerceHome,
      screenshots: [
        ProjectImages.ecommerceHome,
        ProjectImages.ecommerceProduct,
        ProjectImages.ecommerceCart,
        ProjectImages.ecommerceCheckout,
      ],
      features: [
        'User authentication and profile management',
        'Product browsing with search and filters',
        'Shopping cart and wishlist functionality',
        'Secure payment gateway integration',
        'Real-time order tracking',
        'Push notifications for order updates',
        'Clean architecture for scalability',
      ],
    ),
    Project(
      title: 'Food Delivery App',
      description:
          'Built a full food delivery app with restaurant browsing, cart, '
          'order tracking, and payment gateway.',
      technologies: ['Flutter', 'GetX', 'Firebase', 'Google Maps'],
      imageUrl: ProjectImages.foodHome,
      screenshots: [
        ProjectImages.foodHome,
        ProjectImages.foodMenu,
        ProjectImages.foodCart,
        ProjectImages.foodTracking,
      ],
      features: [
        'Restaurant browsing and menu display',
        'Cart management with real-time updates',
        'Order placement and tracking',
        'Firebase Authentication and Firestore',
        'FCM for real-time order notifications',
        'Google Maps integration for delivery tracking',
        'GetX for state management and navigation',
      ],
    ),
    Project(
      title: 'E-Taxi Booking App',
      description:
          'Developed ride-hailing app with passenger/driver modes and '
          'live location tracking.',
      technologies: ['Flutter', 'GetX', 'Firebase', 'Google Maps'],
      imageUrl: ProjectImages.taxiHome,
      screenshots: [
        ProjectImages.taxiHome,
        ProjectImages.taxiMap,
        ProjectImages.taxiBooking,
        ProjectImages.taxiDriver,
      ],
      features: [
        'Dual mode: Passenger and Driver interfaces',
        'Live location tracking with Google Maps',
        'Real-time ride booking and matching',
        'Fare estimation and route mapping',
        'In-app chat between driver and passenger',
        'Payment integration',
        'Rating and review system',
      ],
    ),
  ];

  // Experience & Education
  static const List<Experience> experiences = [
    Experience(
      title: 'Flutter Developer',
      company: 'Freelance',
      period: '2022 - Present',
      isEducation: false,
      responsibilities: [
        'Developed and deployed scalable cross-platform Android & iOS applications using Flutter and Dart',
        'Designed responsive and pixel-perfect user interfaces adhering to Material Design guidelines',
        'Integrated RESTful APIs with efficient JSON parsing and state management (Riverpod, BLoC, GetX)',
        'Implemented Firebase services including Authentication, Cloud Firestore, Storage, and FCM',
        'Collaborated with UI/UX designers and backend developers using Git/GitHub for version control',
        'Identified bugs, optimized app performance, and maintained clean, reusable code architecture',
      ],
    ),
    Experience(
      title: 'Bachelor of Business Administration',
      company: 'Azam Khan Commerce College',
      period: '2019 - 2022',
      isEducation: true,
      responsibilities: [],
    ),
  ];

  // Certifications
  static const List<Map<String, String>> certifications = [
    {
      'title': 'Flutter & Dart – The Complete Guide',
      'issuer': 'Ostad',
      'year': '2024',
    },
    {
      'title': 'Firebase Essentials',
      'issuer': 'Google Training',
      'year': '2024',
    },
  ];

  // Services Offered
  static const List<Service> services = [
    Service(
      title: 'Mobile App Development',
      description:
          'Build high-performance cross-platform mobile applications for iOS '
          'and Android using Flutter and Dart.',
      icon: Icons.phone_android,
      features: [
        'Cross-platform development',
        'Native performance',
        'Beautiful UI/UX design',
        'App store deployment',
      ],
    ),
    Service(
      title: 'Firebase Integration',
      description:
          'Integrate Firebase services including Authentication, Firestore, '
          'Storage, and Push Notifications.',
      icon: Icons.cloud,
      features: [
        'User authentication',
        'Cloud database',
        'File storage',
        'Push notifications',
      ],
    ),
    Service(
      title: 'State Management',
      description:
          'Implement efficient state management solutions using BLoC, GetX, '
          'or Riverpod for scalable applications.',
      icon: Icons.settings_suggest,
      features: [
        'BLoC pattern implementation',
        'GetX integration',
        'Riverpod setup',
        'Clean architecture',
      ],
    ),
    Service(
      title: 'API Integration',
      description:
          'Seamlessly integrate RESTful APIs with proper error handling, '
          'caching, and data management.',
      icon: Icons.api,
      features: [
        'RESTful API integration',
        'JSON parsing',
        'Error handling',
        'Offline caching',
      ],
    ),
    Service(
      title: 'UI/UX Implementation',
      description:
          'Transform designs into pixel-perfect, responsive interfaces that '
          'work seamlessly across all screen sizes.',
      icon: Icons.design_services,
      features: [
        'Responsive design',
        'Material Design',
        'Custom animations',
        'Accessibility compliance',
      ],
    ),
    Service(
      title: 'App Optimization',
      description:
          'Optimize app performance, reduce load times, and fix bugs to '
          'ensure smooth user experience.',
      icon: Icons.speed,
      features: [
        'Performance optimization',
        'Bug fixing',
        'Code refactoring',
        'Memory management',
      ],
    ),
  ];

  // Helper method to get skills by category
  static List<Skill> getSkillsByCategory(String category) {
    return skills.where((skill) => skill.category == category).toList();
  }

  // Get all unique categories
  static List<String> get skillCategories {
    return skills.map((skill) => skill.category).toSet().toList();
  }
}
