class OnboardingData {
  final String image;
  final String title;
  final String description;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

const List<OnboardingData> onboardingPages = [
  OnboardingData(
    image: 'assets/image/mask group.png',
    title: 'Discover Trends',
    description: 'Now we are here to provide\nvariety of the best fashion',
  ),
  OnboardingData(
    image: 'assets/image/assets/image/Frame_61.png',
    title: 'Latest out fit',
    description: 'Express your self through\nthe art of the fashionism',
  ),
];
