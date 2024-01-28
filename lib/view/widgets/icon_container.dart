



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class IconContainer extends StatelessWidget {

   IconContainer({super.key,required this.iconData,this.onTap});
   IconData iconData;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
            color: AppColors.appWhiteColor,
            shape: BoxShape.circle
        ),
        child: Icon(iconData,color: AppColors.appBlackColor,size: 16.sp,),
      ),
    );
  }
}