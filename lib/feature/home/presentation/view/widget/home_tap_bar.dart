import 'package:flutter/material.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';

class HomeTapBar extends StatefulWidget {
  const HomeTapBar({super.key, required this.category, required this.onTap});

  final List<CategoryEntity> category;
  final Function(String categorySlug) onTap;

  @override
  State<HomeTapBar> createState() => _HomeTapBarState();
}

class _HomeTapBarState extends State<HomeTapBar> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });

              widget.onTap(widget.category[index].slug);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              margin: const EdgeInsets.only(top: 14, right: 10),
              decoration: BoxDecoration(
                color: selectedCategory == index
                    ?  AppColors.orangeDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedCategory == index
                      ? Colors.transparent
                      : Colors.grey,
                  width: 1.5,
                ),
              ),
              child: Text(
                widget.category[index].name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: selectedCategory == index
                      ? AppColors.white
                      : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
