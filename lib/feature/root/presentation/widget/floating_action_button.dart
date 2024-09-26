import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_color.dart';
class FABWidget extends StatelessWidget {
  Function selectFun;
  FABWidget({super.key,required this.selectFun});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      backgroundColor: AppColor.blue,
      shape:  StadiumBorder(
        side: BorderSide(color: AppColor.white,width: 4.r
        )
      ),
      onPressed: () {
        selectFun();
      },
      child:  const Icon(Icons.add,size: 40,color: AppColor.white,),
      //params
    );
  }
}
