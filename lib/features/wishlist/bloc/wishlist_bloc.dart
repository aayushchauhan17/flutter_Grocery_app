import 'package:bloc/bloc.dart';
import 'package:flutter_blocc/data/wishlist_data.dart';
import 'package:flutter_blocc/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    // on<WishlistEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<WishlistInitialEvent>(
      (event, emit) {
        emit(WishlistSusscessData(wishlistData: wishlistItems));
      },
    );
  }
}
