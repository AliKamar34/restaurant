import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/repos/menu_repo_impl.dart';
import 'package:restaurant/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CartCubit(MenuRepoImpl())..getcartItems(),
        child: CartViewBody(),
      ),
    );
  }
}
