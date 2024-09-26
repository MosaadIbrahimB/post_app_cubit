import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_color.dart';
import 'package:task/feature/root/control/root_cubit.dart';
import 'package:task/feature/root/presentation/screen/layout_screen.dart';
class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
    notchMargin: 12.r,
      height: 65.h,
      iconSize: 30,
      elevation: 0,
      backgroundColor: AppColor.white,
      activeColor: AppColor.blue,
      inactiveColor: AppColor.gray,
      icons: const [ Icons.list,Icons.settings],
      activeIndex: counter,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: changed ,
      //other params
    );
  }
  changed(index){
  context.read<RootCubit>().changeScreen(index);
  }
}