import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/widgets/product_item_card.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCubitProductBuilder extends StatelessWidget {
  const HomeCubitProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductLoading ||
          current is ProductSuccess ||
          current is ProductError,
      builder: (context, state) {
       
        if (state is ProductSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 163 / 288,
              ),
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                final product = state.product[index];
                return ProductItemCard(
                  onTap: () {},
                  title: product.title,
                  discount: product.discount.toDouble(),
                  price: product.price.toDouble(),
                  rating: product.rating.toDouble(),
                  image: product.images.first,
                );
              },
            ),
          );
        }
        if (state is ProductError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Expanded(
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
    );
  }
}
