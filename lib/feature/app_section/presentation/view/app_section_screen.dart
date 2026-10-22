import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';

import 'package:shoppingapp/feature/account/presentation/view/screens/account_screen.dart';
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart';
import 'package:shoppingapp/feature/app_section/presentation/view_model/app_section_cubit.dart';
import 'package:shoppingapp/feature/cart/presentation/view/screens/cart_screen.dart';
import 'package:shoppingapp/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:shoppingapp/feature/favorite/presentation/view/screens/favourite_screen.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:shoppingapp/feature/home/presentation/view/screens/home_screen.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSectionCubit, int>(
      builder: (context, currentIndex) {
        final screens = <Widget>[
          MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (_) => serviceLocator<HomeCubit>()..getHomeData(),
              ),
              BlocProvider<FavoriteCubit>(
                create: (_) => serviceLocator<FavoriteCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
          BlocProvider<CartCubit>(
            create: (_) => serviceLocator<CartCubit>()..getCart(),
            child: const CartScreen(),
          ),
          currentIndex ==2?
          BlocProvider<FavoriteCubit>(
            create: (_) => serviceLocator<FavoriteCubit>(),
            child: const FavouriteScreen(),
          ):const SizedBox.shrink(),
          currentIndex == 3?
            BlocProvider<AccountCubit>(
              create: (_) => serviceLocator<AccountCubit>(),
              child: const AccountScreen(),
            ):const SizedBox.shrink(),
        ];

        return Scaffold(
          body: IndexedStack(index: currentIndex, children: screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<AppSectionCubit>().changeTab(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryOrange,
            unselectedItemColor: AppColors.mutedText,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
