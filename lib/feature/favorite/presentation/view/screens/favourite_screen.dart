import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/widgets/product_item_card.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_cubit.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteError) {
              return Center(child: Text(state.errorMessage));
            }  if (state is FavoriteSuccess) {
              final products = state.favoriteProducts;
              if (products.isEmpty) {
                return const Center(
                  child: Column(
                    children: [
                      Icon(Icons.favorite_border, size: 150),
                      SizedBox(height: 16),
                      Text('There are no products in your favourite list .'),
                    ],
                  ),
                );
              }
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItemCard(
                      title: product.title,
                      discount: product.discount,
                      price: product.price,
                      rating: product.rating,
                      image: product.images[0],
                      onTap: () {
                        // Handle product tap
                      },
                    );
                  },
                ),
              );
            }
            return   Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 24,
                      childAspectRatio: 163 / 288,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => ProductItemCard(
                      onTap: () {},
                      title: '',
                      discount: 22,
                      price: 22,
                      rating: 3,
                      image:
                          'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
                    ),
                  ),
                ),
              );
          },
        ),
      ],
    );
  }
}
