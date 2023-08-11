part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartGettingDataState extends CartState {
  final List<ProductDataModel> cartData;

  CartGettingDataState({
    required this.cartData,
  });
}
