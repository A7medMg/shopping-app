import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/helper/spacing_helper.dart';
import 'package:shoppingapp/feature/home/presentation/view/widget/home_category_bloc_builder.dart';
import 'package:shoppingapp/feature/home/presentation/view/widget/home_cubit_product_builder.dart';
import 'package:shoppingapp/feature/search/presentation/screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Hi",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()),
                    );
                  },
                  icon: const Icon(Icons.search, color: Colors.black),
                  tooltip: 'Search products',
                ),
              ],
            ),

            Text(
              "Let’s start your day",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            HomeCategoryBlocBuilder(),
            verticalSpacing(10),
            HomeCubitProductBuilder(),
          ],
        ),
      ),
    );
  }
}
