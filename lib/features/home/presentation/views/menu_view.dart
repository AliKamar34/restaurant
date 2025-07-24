import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/repos/menu_repo_impl.dart';
import 'package:restaurant/features/home/presentation/manager/cubit/menu_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/menu_view_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MenuCubit(MenuRepoImpl())..getMenuItems(),
        child: MenuViewBody(),
      ),
    );
  }
}
