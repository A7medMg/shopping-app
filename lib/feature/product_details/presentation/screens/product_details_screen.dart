import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/core/widgets/custom_button.dart';
import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';
import 'package:shoppingapp/feature/product_details/domain/use_case/get_product_details_use_case.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GetProductDetailsUseCase useCase;
  final int productId;

  const ProductDetailsScreen({
    super.key,
    required this.useCase,
    this.productId = 1,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsEntity? _product;
  bool _isLoading = true;
  String? _errorMessage;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await widget.useCase.invoke(widget.productId);

    if (!mounted) return;

    if (result is Success<ProductDetailsEntity>) {
      setState(() {
        _product = result.data;
        _isLoading = false;
      });
    } else if (result is AppError<ProductDetailsEntity>) {
      setState(() {
        _errorMessage = result.messageError;
        _isLoading = false;
      });
    } else {
      setState(() {
        _errorMessage = 'Unexpected error occurred';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors
                .black, 
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? _buildError()
          : _product == null
          ? const Center(child: Text('Product not found'))
          : _buildProduct(_product!),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(
              _errorMessage ?? 'Failed to load product',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProduct,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProduct(ProductDetailsEntity product) {
    final images = product.images.isNotEmpty
        ? product.images
        : product.thumbnail.isNotEmpty
        ? [product.thumbnail]
        : <String>[];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSlider(images),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.category.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (product.discountPercentage > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${product.discountPercentage.toStringAsFixed(2)}% OFF',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 22),
                          const SizedBox(width: 5),
                          Text(
                            product.rating.toStringAsFixed(2),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${product.reviews.length} reviews',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            product.stock > 0
                                ? Icons.check_circle_outline
                                : Icons.remove_circle_outline,
                            color: product.stock > 0
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            product.stock > 0
                                ? 'In Stock (${product.stock})'
                                : 'Out of Stock',
                            style: TextStyle(
                              color: product.stock > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (product.reviews.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('No reviews available yet.'),
                        )
                      else
                        ...product.reviews.map(_buildReview),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: CustomButton(
              title: 'Add to Cart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Add to Cart UI only - functionality not implemented',
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSlider(List<String> images) {
    if (images.isEmpty) {
      return Container(
        height: 260,
        width: double.infinity,
        color: Colors.grey.shade100,
        child: const Icon(Icons.image_not_supported_outlined, size: 70),
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 280,
            viewportFraction: 1,
            enableInfiniteScroll: images.length > 1,
            onPageChanged: (index, reason) {
              setState(() => _currentImageIndex = index);
            },
          ),
          items: images.map((url) {
            return SizedBox(
              width: double.infinity,
              child: Image.network(
                url,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image_outlined, size: 70),
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            );
          }).toList(),
        ),
        if (images.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == entry.key
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildReview(ProductReviewEntity review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: Colors.grey.withValues(alpha: 0.07),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.person_outline),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    review.reviewerName.isNotEmpty
                        ? review.reviewerName
                        : 'Customer',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text(' ${review.rating}'),
              ],
            ),
            const SizedBox(height: 10),
            Text(review.comment),
            if (review.date.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                review.date.length >= 10
                    ? review.date.substring(0, 10)
                    : review.date,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
