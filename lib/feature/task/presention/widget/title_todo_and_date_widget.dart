import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/root/control/root_cubit.dart';

import '../../../root/presentation/widget/date_line_widget.dart';
import '../../../root/presentation/widget/like_appbar_widget.dart';

class TitleTodoAndDateWidget extends StatelessWidget {
  const TitleTodoAndDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, int>(
      builder: (context, state) {
        return Stack(
          children: [
            const LikeAppBarWidget(),
            state == 1
                ? const SizedBox()   //اللى هى شاشة الاعدادات
                : const DateLineWidget(),//اللى هى شاشة التاسك
          ],
        );
      },
    );
  }
}



