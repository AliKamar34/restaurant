import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/functions/show_toast.dart';
import 'package:restaurant/features/home/data/models/menu_item_model.dart';
import 'package:restaurant/features/home/presentation/manager/cubit/menu_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/grid_menu_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              return GridMenuItem(menuItemModel: state.menuItems[index]);
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: MediaQuery.sizeOf(context).aspectRatio * 2.19,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GridMenuItem(
                  menuItemModel: MenuItemModel(
                    name: 'Loading...',
                    imageUrl:
                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT830QVulpUmgjbcdqypXP5Cl4CkPxRpi2ZsWs4vKugj10_wQOujs3IE_LizsXcp3YkAsnl68PiWf3P6I5M_Ih4mliiKpfNWKFVRRORNg',
                    price: 0.0,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
