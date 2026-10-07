import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/helper/spacing_helper.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/core/widgets/product_item_card.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/use_case/get_all_category_use_case.dart';
import 'package:shoppingapp/feature/home/presentation/view/widget/home_tap_bar.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/product_cubit.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CategoryEntity>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    categoriesFuture = getCategories();
  }

  Future<List<CategoryEntity>> getCategories() async {
    final result = await serviceLocator<GetAllCategoryUseCase>().invoke();

    return switch (result) {
      Success<List<CategoryEntity>>() => result.data,
      AppError<List<CategoryEntity>>() => throw Exception(result.messageError),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ProductCubit>()..getAllProduct(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20),
                Text('Hi,', style: Theme.of(context).textTheme.bodyLarge),
                verticalSpacing(4),
                Text(
                  "Let's Start Your Day",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                verticalSpacing(10),

                FutureBuilder<List<CategoryEntity>>(
                  future: categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 50.h,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (snapshot.hasError) {
                      return SizedBox(
                        height: 50.h,
                        child: Center(
                          child: Text(
                            snapshot.error.toString().replaceFirst(
                              'Exception: ',
                              '',
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      );
                    }

                    final categories = snapshot.data ?? [];

                    if (categories.isEmpty) {
                      return const SizedBox();
                    }

                    return HomeTapBar(
                      category: categories,
                      onTap: (index) {
                        // Get products by category later
                      },
                    );
                  },
                ),

                verticalSpacing(20),

                Expanded(
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ProductError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 50,
                                color: Colors.red,
                              ),

                              verticalSpacing(10),

                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              verticalSpacing(15),

                              ElevatedButton(
                                onPressed: () {
                                  context.read<ProductCubit>().getAllProduct();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      if (state is ProductSuccess) {
                        final products = state.product;

                        if (products.isEmpty) {
                          return Center(
                            child: Text(
                              'No products found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }

                        return GridView.builder(
                          padding: EdgeInsets.only(bottom: 20.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 0.75,
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
                                  : '',
                              onTap: () {},
                              favoriteOnTap: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border_rounded),
                              ),
                              addToCartOnTap: () {},
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
