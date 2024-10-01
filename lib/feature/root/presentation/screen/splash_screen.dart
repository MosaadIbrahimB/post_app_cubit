import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/string_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goToLayOutScreen(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Image.asset(
            "assets/images/logo.png",
            width: 189.w,
            height: 211.h,
          ),
          const Expanded(child: SizedBox()),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                "assets/images/route_blue.png",
                width: 128.w,
                height: 128.h,
              ),
              Positioned(
                left: -30.w,
                bottom: 10.h,
                child: Text(
                  "supervised by Mohamed Nabil",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  goToLayOutScreen(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        if(context.mounted){
          context.go(StringRouter.layoutScreen);
        }
      },
    );

  }
}
