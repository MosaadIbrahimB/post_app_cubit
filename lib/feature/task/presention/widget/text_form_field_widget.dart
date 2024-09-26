import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TFFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  const TFFieldWidget(
      {super.key, required this.title, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "write anything";
        }
      },
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.r))),
    );
  }
}
