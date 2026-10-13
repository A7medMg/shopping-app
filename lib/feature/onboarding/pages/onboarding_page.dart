import 'package:flutter/material.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/onboarding/data/onboarding_data.dart';

import '../../../../core/storage/local_storage.dart';

import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_image.dart';
import '../widgets/onboarding_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    await LocalStorage.completeOnBoarding();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutesName.login,
      (route) => false,
    );
  }

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            // ==========================================
            // TOP BAR
            // ==========================================

            SizedBox(
              height: 48,
              child: Row(
                children: [
                  if (_currentPage == 1)
                    IconButton(
                      onPressed: _previousPage,
                      padding: const EdgeInsets.only(left: 12),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color(0xFF222222),
                      ),
                    )
                  else
                    const SizedBox(width: 16),

                  const Spacer(),

                  TextButton(
                    onPressed: _finishOnboarding,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),

                  const SizedBox(width: 4),
                ],
              ),
            ),

            // ==========================================
            // PAGE VIEW
            // ==========================================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  final page = onboardingPages[index];

                  return Column(
                    children: [
                      const SizedBox(height: 2),

                      // Image
                      OnboardingImage(image: page.image),

                      const SizedBox(height: 10),

                      // Indicators
                      OnboardingIndicator(
                        currentIndex: _currentPage,
                        itemCount: onboardingPages.length,
                      ),

                      const SizedBox(height: 35),

                      // Title
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF222222),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Description
                      Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.35,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // ==========================================
            // BOTTOM BUTTON
            // ==========================================
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 18),
              child: OnboardingButton(
                title: _currentPage == onboardingPages.length - 1
                    ? 'Get started'
                    : 'Next',
                onPressed: _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
