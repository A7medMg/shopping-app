import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/helper/spacing_helper.dart';
import 'package:shoppingapp/core/theme/app_colors.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_cubit.dart';

class ProductItemCard extends StatefulWidget {
  const ProductItemCard({
    super.key,
    required this.onTap,
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
  final String title;
  final double discount;
  final double price;
  final double rating;
  final String image;
  final void Function()? onTap;

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  bool isFavorite = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double oldPrice = widget.discount > 0
        ? widget.price / (1 - (widget.discount / 100))
        : widget.price + 50;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.diagonal3Values(
            _isHovered ? 1.02 : 1.0,
            _isHovered ? 1.02 : 1.0,
            1.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primaryOrange.withValues(alpha: 0.5)
                  : Colors.grey.shade200,
              width: _isHovered ? 2.w : 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.primaryOrange.withValues(alpha: 0.15)
                    : Colors.grey.withValues(alpha: 0.08),
                blurRadius: _isHovered ? 16 : 8,
                offset: _isHovered ? const Offset(0, 8) : const Offset(0, 4),
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
                        imageUrl: widget.image,
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
                    child: IconButton(
                      onPressed: () {
                        if (!isFavorite) {
                        context.read<FavoriteCubit>().addToFavorite(widget.title);
                        } else {
                          context.read<FavoriteCubit>().removeFavorite("");
                        }

                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 22,
                        color: isFavorite ? Colors.red : Colors.white,
                        shadows: const [
                          Shadow(color: Colors.black54, blurRadius: 4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
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
                            "EGP ${widget.price.toStringAsFixed(0)}",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                          ),
                          horizontalSpacing(6),
                          if (widget.discount > 0)
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
                            widget.rating.toString(),
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
      ),
    );
  }
}
