import 'package:flutter/material.dart';
import 'package:shoppingapp/feature/home/presentation/view/screens/home_screen.dart';
class AppSection extends StatelessWidget {
  const AppSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:HomeScreen(),
    );
  }
}