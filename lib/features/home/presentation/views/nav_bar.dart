import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:restaurant/core/utils/app_colors.dart';
import 'package:restaurant/core/utils/app_text_styles.dart';
import 'package:restaurant/features/home/presentation/views/menu_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int selectedIndex = 0;
  static const List<Widget> pages = [MenuView(), Placeholder(), MenuView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 6,
            bottom: 10,
            right: 16,
            left: 16,
          ),
          child: GNav(
            tabActiveBorder: Border.symmetric(
              horizontal: BorderSide(width: 2, color: Colors.transparent),
            ),
            tabBorderRadius: 8,
            gap: 5,
            color: AppColors.secondaryTextColor,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            tabs: [
              GButton(
                icon: Icons.menu,
                iconSize: 20,
                text: 'Menu',
                textStyle: TextStyles.medium12(
                  context,
                ).copyWith(color: AppColors.secondaryColor),
                rippleColor: AppColors.secondaryColor.withAlpha(25),
                backgroundColor: AppColors.secondaryColor.withAlpha(25),
              ),
              GButton(
                icon: Icons.shopping_cart,
                iconSize: 20,
                text: 'Cart',
                textStyle: TextStyles.medium12(
                  context,
                ).copyWith(color: Color(0xff00AF6A)),
                rippleColor: Color(0xff00AF6A).withAlpha(25),
                backgroundColor: Color(0xff00AF6A).withAlpha(25),
              ),
              GButton(
                icon: Icons.person,
                iconSize: 20,
                text: 'Profile',
                textStyle: TextStyles.medium12(
                  context,
                ).copyWith(color: Color(0xff7F00FF)),
                rippleColor: Color(0xff7F00FF).withAlpha(25),
                backgroundColor: Color(0xff7F00FF).withAlpha(25),
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
                // if (index == 0){
                //   BlocProvider.of<MenuCubit>(context).getMenuItems();
                // }
              });
            },
          ),
        ),
      ),
    );
  }
}
