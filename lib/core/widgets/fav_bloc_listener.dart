import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_cubit.dart' show FavoriteCubit;
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_state.dart';

class FavBlocListener extends StatelessWidget {
  const FavBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listenWhen: (previous, current) =>
          current is AddToFavoriteSuccess ||
          current is AddToFavoriteError ||
          current is AddToFavoriteLoading ||
          current is RemoveFavoriteSuccess ||
          current is RemoveFavoriteError ||
          current is RemoveFavoriteLoading,
      listener: (context, state) {
        if (state is AddToFavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to favorites successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AddToFavoriteError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
          );
        }
        if (state is RemoveFavoriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is RemoveFavoriteError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}