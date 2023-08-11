import 'package:flutter/material.dart';
import 'package:flutter_blocc/features/wishlist/Ui/wishlist_product_cart.dart';
import 'package:flutter_blocc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    // TODO: implement initState
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSusscessData:
              final wishlistItemData = state as WishlistSusscessData;

              return wishlistItemData.wishlistData.length == 0
                  ? Center(
                      child: Text("Empty WishList"),
                    )
                  : ListView.builder(
                      itemCount: wishlistItemData.wishlistData.length,
                      itemBuilder: (context, index) {
                        return WishlistProductCard(
                            productData: wishlistItemData.wishlistData[index],
                            wishlistBloc: wishlistBloc);
                      });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
