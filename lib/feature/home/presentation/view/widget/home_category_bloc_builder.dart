import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/feature/home/presentation/view/widget/home_tap_bar.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategoryBlocBuilder extends StatelessWidget {
  const HomeCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child:BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is CategorySuccess || current is CategoryError|| current is CategoryLoading,
        builder: (context, state) {
        if (state is CategorySuccess) {
          return HomeTapBar(
            category: state.category,
            onTap: (categorySlug) => context
                .read<HomeCubit>()
                .getAllProductByCategory(categorySlug),
          );
           
        }
        if (state is CategoryError) {
          return Center(
            child: Text(state.message),
          );
        } 
        return Skeletonizer(
          enabled: true,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              margin: const EdgeInsets.only(top: 14, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
        }
      )
    );
  }
}
