import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/widgets/custom_text_form_field.dart';
import 'package:shoppingapp/core/widgets/product_item_card.dart';
import 'package:shoppingapp/feature/search/presentation/view_model/search_cubit.dart';
import 'package:shoppingapp/feature/search/presentation/view_model/search_state.dart';
import 'package:shoppingapp/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:shoppingapp/feature/product_details/domain/use_case/get_product_details_use_case.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<SearchCubit>(),
      child: const _SearchScreenBody(),
    );
  }
}

class _SearchScreenBody extends StatelessWidget {
  const _SearchScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Search for products...',
              prefixIcon: const Icon(Icons.search, color: Colors.black87),
              onChanged: context.read<SearchCubit>().search,
              keyboardType: TextInputType.text,
              action: TextInputAction.search,
              borderRadius: BorderRadius.circular(14.r),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Center(child: Text('Search for a product'));
                  }

                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchError) {
                    return Center(child: Text(state.messageError));
                  }

                  if (state is SearchEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  if (state is SearchSuccess) {
                    return GridView.builder(
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 0.68,
                      ),
                      itemBuilder: (context, index) {
                        final product = state.products[index];

                        return ProductItemCard(
                          title: product.title,
                          price: product.price,
                          discount: product.discount,
                          rating: product.rating,
                          image: product.images.isNotEmpty
                              ? product.images.first
                              : '',

                          onTap: () {
                            debugPrint('SEARCH PRODUCT CLICKED: ${product.id}');

                            try {
                              final useCase =
                                  serviceLocator<GetProductDetailsUseCase>();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(
                                    useCase: useCase,
                                    productId: product.id,
                                  ),
                                ),
                              );
                            } catch (e, stackTrace) {
                              debugPrint('OPEN PRODUCT DETAILS ERROR: $e');
                              debugPrintStack(stackTrace: stackTrace);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
