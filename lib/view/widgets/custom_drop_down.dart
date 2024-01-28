


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_font_style.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;

  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.items,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Sorting by ',
            style: myStyleInter(14.sp, AppColors.appBlackColor, FontWeight.w400),
          ),
        ),
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(item, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color:AppColors.appBlackColor),
              ),
            ),
          );
        }).toList(),
        value: widget.selectedValue,
        onChanged: widget.onChanged,

        buttonStyleData:  ButtonStyleData(
          height: 50.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.appGreyColor,width: 0.5),
              color: AppColors.appWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r))
          ),
          width: double.infinity,
        ),


        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.appWhiteColor
          ),

          offset: const Offset(168, -4),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        // Other styling options can be added here
      ),
    );
  }
}
