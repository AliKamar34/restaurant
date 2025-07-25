import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/functions/show_bottom_sheet.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/features/home/data/repos/menu_repo_impl.dart';
import 'package:restaurant/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/home/presentation/manager/menu_cubit/menu_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/bottom_sheet_content.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_grid_idicator.dart';
import 'package:restaurant/features/home/presentation/views/widgets/grid_menu_item.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        if (state is MenuFailuer) {
          showToast(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is MenuSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: MediaQuery.sizeOf(context).aspectRatio * 2.19,
            ),
            itemCount: state.menuItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showBlurBottomSheet(
                    context,
                    BlocProvider(
                      create: (context) => CartCubit(MenuRepoImpl()),
                      child: BottomSheetContent(
                        image: state.menuItems[index].imageUrl,
                        name: state.menuItems[index].name,
                        price: state.menuItems[index].price,
                      ),
                    ),
                  );
                },
                child: GridMenuItem(menuItemModel: state.menuItems[index]),
              );
            },
          );
        } else {
          return CustomGridIdicator();
        }
      },
    );
  }
}
