import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../control/date_time_cubit.dart';
class TextDatePickerWidget extends StatelessWidget {
  const TextDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateTimeCubit, DateTime>(
      builder: (BuildContext context, state) {
        return Text(
          context.read<DateTimeCubit>().state.toString().substring(0,10),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}