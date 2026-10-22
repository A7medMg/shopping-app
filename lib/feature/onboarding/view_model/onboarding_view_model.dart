
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();

  int currentPage = 0;

  bool get isLastPage => currentPage == 1;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  Future<void> nextPage() async {
    if (isLastPage) return;

    await pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  Future<void> completeOnboarding() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isFirstTime', false);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

