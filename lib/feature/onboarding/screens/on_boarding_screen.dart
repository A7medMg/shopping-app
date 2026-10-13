import 'package:flutter/material.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/core/storage/local_storage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  final List<OnBoardingModel> pages = [
    const OnBoardingModel(
      image: 'assets/image/Mask group.png',
      title: 'Discover Trends',
      description: 'Now we are here to providevariety of the best fashion',
    ),
    const OnBoardingModel(
      image: 'assets/image/Frame 61.png',
      title: 'Latest out fit',
      description: 'Express your self throughthe art of the fashionism',
    ),
  ];

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

  Future<void> _finishOnBoarding() async {
    await LocalStorage.completeOnBoarding();

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutesName.login,
      (route) => false,
    );
  }

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnBoarding();
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
      backgroundColor: const Color(0xffF4F4F4),

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
                  // Back button - appears only on page 2
                  if (_currentPage == 1)
                    IconButton(
                      onPressed: _previousPage,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color(0xff222222),
                      ),
                    )
                  else
                    const SizedBox(width: 16),

                  const Spacer(),

                  // Skip
                  TextButton(
                    onPressed: _finishOnBoarding,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),

                  const SizedBox(width: 5),
                ],
              ),
            ),

            // ==========================================
            // PAGE VIEW
            // ==========================================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Column(
                    children: [
                      // ==========================================
                      // IMAGE
                      // ==========================================

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: 1.08,
                            child: Image.asset(
                              page.image,
                              fit: BoxFit.cover,

                              // لو الصورة مش موجودة
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade300,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ==========================================
                      // INDICATORS
                      // ==========================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(pages.length, (index) {
                          final bool isActive = index == _currentPage;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? const Color(0xff333333)
                                  : const Color(0xffBDBDBD),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 35),

                      // ==========================================
                      // TITLE
                      // ==========================================
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff222222),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // ==========================================
                      // DESCRIPTION
                      // ==========================================
                      Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.35,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff666666),
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
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _nextPage,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffb000),
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),

                  child: Text(
                    _currentPage == pages.length - 1 ? 'Get started' : 'Next',

                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
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

// ==========================================
// ONBOARDING MODEL
// ==========================================

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
