import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_blocc/data/cart_data.dart';
import 'package:flutter_blocc/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // on<CartEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartGettingDataState(cartData: cartItems));
  }
}
