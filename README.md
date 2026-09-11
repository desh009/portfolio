# Flutter Portfolio Website

A production-quality, responsive Flutter Web portfolio website showcasing professional experience, skills, projects, and services.

## 🌟 Features

- **Fully Responsive** - Works seamlessly on desktop, tablet, and mobile devices
- **Modern Dark Theme** - Premium dark UI with gradient accents
- **Smooth Animations** - Entrance animations, hover effects, and micro-interactions
- **Section Navigation** - Smooth scroll-based navigation with fixed navbar
- **Clean Architecture** - Organized code structure with separation of concerns
- **Centralized Data** - Easy content management through `portfolio_data.dart`
- **Performance Optimized** - Uses const widgets and efficient rendering
- **Accessible** - Built with accessibility best practices

## 📂 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── app.dart                  # App configuration
├── core/
│   └── theme/
│       └── app_theme.dart    # Centralized theme configuration
├── models/                   # Data models
│   ├── experience.dart
│   ├── project.dart
│   ├── service.dart
│   └── skill.dart
├── data/
│   └── portfolio_data.dart   # Centralized portfolio content
├── screens/
│   └── portfolio_page.dart   # Main portfolio page
└── widgets/                  # Reusable UI components
    ├── about_section.dart
    ├── animated_reveal.dart
    ├── contact_section.dart
    ├── custom_button.dart
    ├── experience_section.dart
    ├── footer.dart
    ├── hero_section.dart
    ├── navbar.dart
    ├── projects_section.dart
    ├── responsive_container.dart
    ├── section_title.dart
    ├── services_section.dart
    ├── skills_section.dart
    └── social_button.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.12.2 or higher)
- A web browser (Chrome recommended for development)

### Installation

1. **Clone or download this project**

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run in development mode**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web --release
   ```

The production build will be in the `build/web` directory.

## ✏️ Customization

### Update Portfolio Content

All portfolio content is centralized in `lib/data/portfolio_data.dart`. Update the following:

1. **Personal Information**
   - Name, role, email, phone, location
   - Social media URLs (GitHub, LinkedIn, Twitter)

2. **About Me**
   - Professional summary
   - Detailed description

3. **Skills**
   - Add/remove skills
   - Update proficiency levels (0.0 to 1.0)
   - Organize by categories

4. **Projects**
   - Project title, description
   - Technologies used
   - Key features
   - GitHub/live demo URLs

5. **Experience & Education**
   - Job titles, companies, periods
   - Responsibilities
   - Education details

6. **Certifications**
   - Certificate name, issuer, year

7. **Services**
   - Service title, description
   - Icons (from Material Icons)
   - Feature lists

### Theme Customization

Edit `lib/core/theme/app_theme.dart` to customize:
- Colors and gradients
- Typography
- Spacing
- Border radius
- Breakpoints

### Add Images

Place your images in `assets/images/` and reference them in the code:
- Profile photo
- Project screenshots
- Other visual assets

## 📱 Sections

1. **Hero Section** - Animated introduction with CTA buttons
2. **About Me** - Professional profile with contact information
3. **Skills** - Organized skills with proficiency indicators
4. **Projects** - Featured projects with details and links
5. **Experience** - Timeline of professional journey
6. **Services** - Services offered with descriptions
7. **Contact** - Contact form and information
8. **Footer** - Links and copyright information

## 🎨 Design Features

- **Responsive Design** - Adapts to mobile (< 768px), tablet (768-1024px), and desktop (> 1024px)
- **Hover Effects** - Interactive elements with smooth transitions
- **Gradient Accents** - Modern gradient overlays and buttons
- **Card Layouts** - Clean card-based UI components
- **Progress Bars** - Animated skill proficiency indicators
- **Timeline** - Vertical timeline for experience section
- **Back to Top** - Floating button for easy navigation

## 🔧 Technical Details

- **Flutter Web** - Built specifically for web deployment
- **Material Design 3** - Uses latest Material Design guidelines
- **Null Safety** - Full null safety implementation
- **Const Optimization** - Uses const widgets for better performance
- **Clean Code** - Follows Flutter best practices and linting rules

## 📦 Dependencies

This project uses only Flutter SDK dependencies:
- `flutter/material.dart` - UI framework
- `cupertino_icons` - iOS-style icons

No external packages required, keeping the bundle size minimal.

## 🌐 Deployment

### GitHub Pages

1. Build the web version
2. Copy contents of `build/web` to your repository
3. Enable GitHub Pages in repository settings

### Firebase Hosting

```bash
flutter build web --release
firebase deploy
```

### Netlify

1. Build: `flutter build web --release`
2. Publish directory: `build/web`

### Any Static Host

Upload the contents of `build/web` directory to your hosting provider.

## 📝 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge
- Opera

## 🤝 Contributing

This is a personal portfolio template. Feel free to fork and customize for your own use.

## 📄 License

This project is open source and available for personal and commercial use.

## 👤 Author

**Desh Bala**
- Email: deshbala999@gmail.com
- Phone: +8801935656149
- Role: Flutter Developer

## 🙏 Acknowledgments

Built with Flutter and Material Design principles.

---

**Note**: Remember to update `lib/data/portfolio_data.dart` with your actual information before deploying!
