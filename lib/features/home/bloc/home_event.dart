part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel selectedData;

  HomeProductWishlistButtonClickEvent(this.selectedData);
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel selectedData;

  HomeProductCartButtonClickEvent(this.selectedData);
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
