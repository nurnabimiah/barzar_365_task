



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_font_style.dart';
import '../../utils/app_text.dart';


class TaskProgressContainerWidget extends StatelessWidget {


 TaskProgressContainerWidget({
   super.key, this.containerColor,
   this.taskTyper,
   this.totalTask,
   required this.percentIndicatorBackgroundColor,
   required this.percentIndicatorProgressColor,
   required this.percent
 });

 Color? containerColor;
 String? taskTyper ;
 var totalTask;
 Color percentIndicatorBackgroundColor;
 Color percentIndicatorProgressColor;
 double percent;




  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r))
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10.h,),
            LinearPercentIndicator(
              width: double.infinity,
              lineHeight: 10.0.h,
              percent: percent,
              animation: true,
              backgroundColor: percentIndicatorBackgroundColor,
              progressColor: percentIndicatorProgressColor,
              animationDuration: 2000,
              linearStrokeCap: LinearStrokeCap.round,
              barRadius: Radius.circular(5),
            ),
            SizedBox(height: 10.h,),




          ],
        ),
      ) ,

    );
  }
}