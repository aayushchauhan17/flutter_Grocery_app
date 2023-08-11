import 'package:flutter/material.dart';
import 'package:flutter_blocc/features/home/bloc/home_bloc.dart';
import 'package:flutter_blocc/features/home/model/home_product_data_model.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel productData;
  final HomeBloc homeBloc;
  const ProductCard(
      {super.key, required this.productData, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productData.imageUrl,
              height: 180,
              fit: BoxFit.contain,
              width: double.maxFinite,
            ),
            Text(
              productData.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productData.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ " + productData.price.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                            HomeProductWishlistButtonClickEvent(productData));
                      },
                      icon: Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc
                            .add(HomeProductCartButtonClickEvent(productData));
                      },
                      icon: Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
