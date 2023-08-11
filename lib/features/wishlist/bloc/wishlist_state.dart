part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSusscessData extends WishlistState {
  final List<ProductDataModel> wishlistData;

  WishlistSusscessData({required this.wishlistData});
}
