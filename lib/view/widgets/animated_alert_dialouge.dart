




import 'package:bazar/utils/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../../utils/app_colors.dart';




class CustomDialog extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? description;
  final Function? onTapTrue;
  final Function? onTapFalse;
  final String? buttonTextTrue;
  final String? buttonTextFalse;
  const CustomDialog({
    Key? key,
    this.icon,
    this.title,
    this.description,
    this.buttonTextTrue,
    this.buttonTextFalse,
    this.onTapFalse,
    this.onTapTrue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 300,
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          const SizedBox(height: 20),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(icon, size: 50, color: AppColors.appWhiteColor,),
          ),
          Container(
            padding:  EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Text(title!, style: myStyleInter(14.sp,Colors.black ), textAlign: TextAlign.center),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(description!,  textAlign: TextAlign.center),
          ),

          Container(height: 0.5, color: Theme.of(context).hintColor),

          Row(children: [

            Expanded(child: InkWell(
              onTap: onTapTrue as void Function()?,
              child: Container(

                padding:  EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
                child: Text(buttonTextTrue!, ),
              ),
            )),

            Expanded(child: InkWell(
              onTap: onTapFalse as void Function()?,
              child: Container(
                padding:  EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: Text(buttonTextFalse!, ),
              ),
            )),

          ])
        ]),),
    );
  }
}








void showAnimatedDialog(BuildContext context, Widget dialog, {
  bool isFlip = false, bool dismissible = true, Duration? duration,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: dismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation1, animation2) => dialog,
    transitionDuration: duration ?? const Duration(milliseconds: 500),
    transitionBuilder: (context, a1, a2, widget) {
      if(isFlip) {
        return Rotation3DTransition(
          alignment: Alignment.center,
          turns: Tween<double>(begin: math.pi, end: 2.0 * math.pi).animate(CurvedAnimation(parent: a1, curve: const Interval(0.0, 1.0, curve: Curves.linear))),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: a1, curve: const Interval(0.5, 1.0, curve: Curves.elasticOut))),
            child: widget,
          ),
        );
      }else {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      }
    },
  );
}

class Rotation3DTransition extends AnimatedWidget {
  const Rotation3DTransition({
    Key? key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
  })  : super(key: key, listenable: turns);

  Animation<double> get turns => listenable as Animation<double>;

  final Alignment alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.0006)
      ..rotateY(turnsValue);
    return Transform(
      transform: transform,
      alignment: const FractionalOffset(0.5, 0.5),
      child: child,
    );
  }
}