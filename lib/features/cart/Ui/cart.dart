import 'package:flutter/material.dart';
import 'package:flutter_blocc/features/cart/Ui/cart_product_card.dart';
import 'package:flutter_blocc/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartGettingDataState:
              final cartItemsData = state as CartGettingDataState;

              return cartItemsData.cartData.length == 0
                  ? Center(
                      child: Text("Empty Cart"),
                    )
                  : ListView.builder(
                      itemCount: cartItemsData.cartData.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                            productData: cartItemsData.cartData[index],
                            cartBloc: cartBloc);
                      });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
