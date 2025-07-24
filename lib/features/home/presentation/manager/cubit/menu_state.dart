part of 'menu_cubit.dart';

sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class MenuLoading extends MenuState {}

final class MenuSuccess extends MenuState {
  final List<MenuItemModel> menuItems;
  MenuSuccess({required this.menuItems});
}

final class MenuFailuer extends MenuState {
  final String errMessage;
  MenuFailuer({required this.errMessage});
}
