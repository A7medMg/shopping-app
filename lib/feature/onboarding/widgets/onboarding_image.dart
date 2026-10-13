import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String image;

  const OnboardingImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 1.08,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
