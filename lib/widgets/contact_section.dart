import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'animated_reveal.dart';
import 'custom_button.dart';
import 'responsive_container.dart';
import 'section_title.dart';
import 'social_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return ResponsiveContainer(
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'Get In Touch',
              subtitle: 'Let\'s work together on your next project',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          if (isMobile)
            _buildMobileLayout()
          else
            _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AnimatedReveal(
            delay: const Duration(milliseconds: 200),
            slideOffset: const Offset(-50, 0),
            child: _ContactInfo(),
          ),
        ),
        const SizedBox(width: AppTheme.spacingXxxl),
        Expanded(
          flex: 2,
          child: AnimatedReveal(
            delay: const Duration(milliseconds: 400),
            slideOffset: const Offset(50, 0),
            child: const _ContactForm(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AnimatedReveal(
          delay: const Duration(milliseconds: 200),
          child: _ContactInfo(),
        ),
        const SizedBox(height: AppTheme.spacingXxl),
        AnimatedReveal(
          delay: const Duration(milliseconds: 400),
          child: const _ContactForm(),
        ),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: AppTheme.heading4,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Feel free to reach out through any of these channels. '
          'I\'m always open to discussing new projects, creative ideas, '
          'or opportunities to be part of your visions.',
          style: AppTheme.bodyMedium,
        ),
        const SizedBox(height: AppTheme.spacingXl),
        _buildContactItem(
          icon: Icons.email_outlined,
          label: 'Email',
          value: PortfolioData.email,
        ),
        const SizedBox(height: AppTheme.spacingL),
        _buildContactItem(
          icon: Icons.phone_outlined,
          label: 'Phone',
          value: PortfolioData.phone,
        ),
        const SizedBox(height: AppTheme.spacingL),
        _buildContactItem(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: PortfolioData.location,
        ),
        const SizedBox(height: AppTheme.spacingXl),
        Text(
          'Connect with me',
          style: AppTheme.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Row(
          children: [
            if (PortfolioData.githubUrl != null)
              SocialButton(
                icon: Icons.code,
                onPressed: () {},
              ),
            const SizedBox(width: AppTheme.spacingM),
            if (PortfolioData.linkedinUrl != null)
              SocialButton(
                icon: Icons.work,
                onPressed: () {},
              ),
            const SizedBox(width: AppTheme.spacingM),
            SocialButton(
              icon: Icons.email,
              onPressed: () {},
            ),
            const SizedBox(width: AppTheme.spacingM),
            if (PortfolioData.twitterUrl != null)
              SocialButton(
                icon: Icons.chat,
                onPressed: () {},
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: AppTheme.spacingL),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                Text(
                  value,
                  style: AppTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusXl),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Send me a message',
              style: AppTheme.heading4.copyWith(fontSize: 20),
            ),
            const SizedBox(height: AppTheme.spacingXl),
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildTextField(
              controller: _emailController,
              label: 'Your Email',
              hint: 'john@example.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Project Discussion',
              icon: Icons.subject,
            ),
            const SizedBox(height: AppTheme.spacingL),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Tell me about your project...',
              icon: Icons.message_outlined,
              maxLines: 5,
            ),
            const SizedBox(height: AppTheme.spacingXl),
            CustomButton(
              text: 'Send Message',
              onPressed: _submitForm,
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: AppTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondaryColor.withOpacity(0.5),
            ),
            prefixIcon: Icon(icon, color: AppTheme.primaryColor),
            filled: true,
            fillColor: AppTheme.surfaceColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              borderSide: const BorderSide(color: AppTheme.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              borderSide: const BorderSide(color: AppTheme.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form submission logic would go here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Message sent successfully!'),
          backgroundColor: AppTheme.primaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
        ),
      );
      
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }
}
