import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String selectedLanguage = 'English(US)';

  // Language mapping: display name -> (modal name, abbreviation)
  final Map<String, Map<String, String>> languages = {
    'English': {'modal': 'English', 'abbreviation': 'US'},
    'Español': {'modal': 'Español', 'abbreviation': 'ES'},
    'Français': {'modal': 'Français', 'abbreviation': 'FR'},
    'German': {'modal': 'German', 'abbreviation': 'DE'},
    'Chinese': {'modal': 'Chinese', 'abbreviation': 'CN'},
    'Japanese': {'modal': 'Japanese', 'abbreviation': 'JP'},
    'Korean': {'modal': 'Korean', 'abbreviation': 'KR'},
  };

  void _showLanguageModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          width: 390,
          height: 470,
          decoration: const BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                width: 52,
                height: 0,
                margin: const EdgeInsets.only(top: 12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.brandPurpleLight,
                      width: 4,
                    ),
                  ),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  20,
                  24,
                  16,
                ), // lg=24, md=16
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select your preferred language',
                      style: AppTheme.modalTitleText,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        color: AppTheme.textOnPurple,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              // Divider
              Container(
                height: 1,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.brandPurpleLight,
                      width: 1,
                    ),
                  ),
                ),
              ),
              // Language list
              Expanded(
                child: ListView(
                  children: languages.entries.map((entry) {
                    final languageKey = entry.key;
                    final languageData = entry.value;
                    final modalName = languageData['modal']!;
                    final abbreviation = languageData['abbreviation']!;
                    final displayName = '$modalName($abbreviation)';

                    return _buildLanguageItem(
                      modalName,
                      selectedLanguage == displayName,
                      setModalState,
                      languageKey,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageItem(
    String language,
    bool isSelected,
    StateSetter setModalState,
    String languageKey,
  ) {
    return GestureDetector(
      onTap: () {
        final languageData = languages[languageKey]!;
        final modalName = languageData['modal']!;
        final abbreviation = languageData['abbreviation']!;
        final displayName = '$modalName($abbreviation)';

        setModalState(() {
          selectedLanguage = displayName;
        });
        setState(() {
          selectedLanguage = displayName;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppTheme.dividerLight, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language, style: AppTheme.modalLanguageText),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.textOnPurple, width: 1),
                color: AppTheme.surfaceColor,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppTheme.textOnPurple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                alignment: Alignment(0.52, 0.0),
              ),
            ),
          ),
          // Gradient overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.transparent, AppTheme.black],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          // Language dropdown
          Positioned(
            top: 60,
            left: 135,
            child: GestureDetector(
              onTap: () => _showLanguageModal(context),
              child: Container(
                width: 120,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.borderWhite, width: 1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedLanguage,
                        style: AppTheme.languageDropdownText,
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppTheme.textOnDark,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Content area with proper spacing
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main text
                  Text(
                    'Connect with\nyour community\nwherever you are',
                    style: AppTheme.onboardingTitle,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20), // 20px gap
                  // First Button
                  Center(
                    child: Container(
                      width: 342,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apple,
                              color: AppTheme.textOnDark,
                              size: 18,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Continue with Apple ID',
                              style: AppTheme.onboardingButtonText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // 8px gap
                  // Second Button
                  Center(
                    child: Container(
                      width: 342,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 14,
                              height: 14,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Continue with Google',
                              style: AppTheme.onboardingButtonText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // 8px gap
                  // Third Button (Transparent)
                  Center(
                    child: Container(
                      width: 342,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // Transparent background
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppTheme.borderWhite, width: 1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: AppTheme.textOnDark,
                              size: 18,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Continue with E-mail',
                              style: AppTheme.onboardingButtonText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // 20px gap after last button
                  // Terms text
                  Center(
                    child: SizedBox(
                      width: 270,
                      height: 34,
                      child: Text(
                        'By signing up, you accept the Terms of Use and Privacy Policy of how we process your data.',
                        style: AppTheme.onboardingTermsText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
