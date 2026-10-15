import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart';

class AccountImage extends StatelessWidget {
  const AccountImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AccountCubit>().pickImage();
      },
      child: Badge(
        offset: const Offset(-9, 140),
        backgroundColor: Colors.white,
        largeSize: 40,
        label: const Icon(Icons.camera_alt_outlined, size: 40),
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: SizedBox(
              width: 160,
              height: 160,
              child: image.trim().isEmpty
                  ? const ColoredBox(
                      color: Color(0xFFEFEFEF),
                      child: Icon(Icons.person, size: 80, color: Colors.grey),
                    )
                  : CachedNetworkImage(
                      imageUrl: "${ApiConstants.baseUrl}/$image",
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                      errorWidget: (context, url, error) => const ColoredBox(
                        color: Color(0xFFEFEFEF),
                        child: Icon(Icons.person, size: 80, color: Colors.grey),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
