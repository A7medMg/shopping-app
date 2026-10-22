
import 'package:flutter/material.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/onboarding/data/onboarding_data.dart';
import 'package:shoppingapp/feature/onboarding/pages/onboarding_page.dart';
import 'package:shoppingapp/feature/onboarding/view_model/onboarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final OnboardingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = OnboardingViewModel();
    viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _finishOnboarding() async {
    await viewModel.completeOnboarding();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutesName.hello,
      (route) => false,
    );
  }

  @override
  void dispose() {
    viewModel.removeListener(_onViewModelChanged);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finishOnboarding,
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: viewModel.pageController,
                itemCount: onboardingPages.length,
                onPageChanged: viewModel.onPageChanged,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    data: onboardingPages[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: viewModel.currentPage == index ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: viewModel.currentPage == index
                        ? Colors.deepOrange
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: viewModel.isLastPage
                      ? _finishOnboarding
                      : viewModel.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    viewModel.isLastPage ? 'Get started' : 'Next',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

