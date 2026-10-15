import 'package:flutter/material.dart';
import 'package:shoppingapp/core/extensions/extensions.dart';

import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';
import 'package:shoppingapp/core/theme/text_styles.dart';
import 'package:shoppingapp/core/widgets/custom_button.dart';

import 'package:shoppingapp/core/helper/spacing_helper.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/image/halloScreen.png',
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.contain,
              ),
              verticalSpacing(32),
              Text(
                'Hello!',
                style: AppTextStyles.h2.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                ),
              ),
              const Spacer(),
              CustomButton(
                title: 'Signup',
                backgroundColor: AppColors.primaryOrange,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesName.register);
                },
              ),
              verticalSpacing(12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutesName.login);
                  },

                  style: OutlinedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    side: const BorderSide(color: AppColors.primaryOrange),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.primaryOrange,
                    ),
                  ),
                ),
              ),
              verticalSpacing(32),
            ],
          ),
        ),
      ),
    );
  }
}
