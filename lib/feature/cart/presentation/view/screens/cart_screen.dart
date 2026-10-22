import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/widgets/product_item_card.dart';
import 'package:shoppingapp/feature/cart/presentation/view_model/cart_cubit.dart';
import 'package:shoppingapp/feature/cart/presentation/view_model/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<CartCubit>().getCart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart'), centerTitle: true),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartInitial || state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(state.errorMessage, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartCubit>().getCart();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (state is CartSuccess) {
            final products = state.cartProducts;

            if (products.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text('There are no products in your cart.'),
                  ],
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 163 / 288,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductItemCard(
                  title: product.title,
                  discount: product.discount,
                  price: product.price,
                  rating: product.rating,
                  image: product.images.isNotEmpty
                      ? product.images.first
                      : 'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
                  onTap: () {},
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
