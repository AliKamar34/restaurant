import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/models/menu_item_model.dart';
import 'package:restaurant/features/home/data/repos/menu_repo.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());
  final MenuRepo menuRepo;
  Future<void> getMenuItems() async {
    emit(MenuLoading());
    var menuItemsResult = await menuRepo.getMenuItems();
    menuItemsResult.fold(
      (failure) {
        emit(MenuFailuer(errMessage: failure.errorMessage));
      },
      (menuItems) {
        emit(MenuSuccess(menuItems: menuItems));
      },
    );
  }
}
