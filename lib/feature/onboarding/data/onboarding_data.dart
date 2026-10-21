
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
    image: 'assets/image/Mask group.png',
    title: 'Discover Trends',
    description: 'Now we are here to provide variety of the best fashion.',
  ),
  OnboardingData(
    image: 'assets/image/Frame 61.png',
    title: 'Latest Outfit',
    description: 'Express yourself through the art of fashion.',
  ),
];

