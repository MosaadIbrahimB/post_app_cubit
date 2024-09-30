import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../control/cubit/radio_select_cubit.dart';

class RadioWidget extends StatelessWidget {
  int value;
  String text;

  RadioWidget({super.key, this.value = 1, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: BlocBuilder<RadioSelectCubit, int>(
        builder: (context, state) {
          return Radio(
            value: value,
            groupValue: context.read<RadioSelectCubit>().state,
            onChanged: (int? value) {
              context.read<RadioSelectCubit>().changeSelect(value);

              if (value == 1) {
                context.setLocale(const Locale("en"));
              } else {
                context.setLocale(const Locale("ar"));
              }
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
