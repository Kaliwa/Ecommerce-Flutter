// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:ecommerce/data/data.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: EdgeInsets.symmetric(vertical: 10),
      crossAxisSpacing: 15,
      crossAxisCount: 2,
      itemCount: products.length,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        return singleItemWidget(
          products[index],
          index == products.length - 1 ? true : false,
        );
      },
    );
  }

  Widget singleItemWidget(Product product, bool lastItem) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: CachedNetworkImage(
                      imageUrl: product.productImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 10,
                    ),
                    child: Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "\$${product.currentPrice}",
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "\$${product.oldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: kRedColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5,
              top: 10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  product.isLiked == true
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height:
              lastItem == true ? MediaQuery.of(context).size.height * 0.5 : 0,
        ),
      ],
    );
  }
}
