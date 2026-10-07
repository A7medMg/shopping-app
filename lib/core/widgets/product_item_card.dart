import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/helper/spacing_helper.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.onTap,
    this.favoriteOnTap,
    this.addToCartOnTap,
    required this.title,
    required this.discount,
    required this.price,
    required this.rating,
    required this.image,
    this.isInCart = false,
  });

  final void Function()? addToCartOnTap;
  final bool isInCart;
  final Widget? favoriteOnTap;

  final String title;
  final double discount;
  final double price;
  final double rating;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final double oldPrice = discount > 0
        ? price / (1 - (discount / 100))
        : price + 50;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.grey.shade200, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.r),
                    topRight: Radius.circular(18.r),
                  ),
                  child: SizedBox(
                    height: 140.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:
                        favoriteOnTap ??
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            size: 20,
                          ),
                          color: Colors.grey,
                        ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    verticalSpacing(4),

                    Row(
                      children: [
                        Text(
                          "EGP ${price.toStringAsFixed(0)}",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                        ),

                        horizontalSpacing(6),

                        if (discount > 0)
                          Text(
                            "EGP ${oldPrice.toStringAsFixed(0)}",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                      ],
                    ),

                    verticalSpacing(4),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),

                        horizontalSpacing(4),

                        Text(
                          rating.toString(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
