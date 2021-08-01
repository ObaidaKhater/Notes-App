import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/theme_data.dart';

class CustomCheckBoxHomePageWidget extends StatelessWidget {
  bool isDone;
  String title;
  int colorHexCode;

  CustomCheckBoxHomePageWidget({
    @required this.isDone,
    @required this.title,
    @required this.colorHexCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Checkbox(
              side: BorderSide(
                width: 1.r,
                color: (this.colorHexCode != null)
                    ? Color(AppThemeData.theme.colorHexDescriptionLight)
                    : Color(AppThemeData.theme.colorHexDescriptionDark),
              ),
              checkColor: (this.colorHexCode != null)
                  ? Color(AppThemeData.theme.colorHoxBlack)
                  : Color(AppThemeData.theme.colorHexPrimary),
              fillColor: (this.colorHexCode != null)
                  ? MaterialStateProperty.all<Color>(
                      Color(AppThemeData.theme.colorHexPrimary),
                    )
                  : MaterialStateProperty.all<Color>(
                      Color(AppThemeData.theme.colorHexBlue),
                    ),
              value: this.isDone,
              shape: CircleBorder(),
              onChanged: null),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            this.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppThemeData.theme
            .titleCheckboxTextStyle(this.colorHexCode, this.isDone),
          ),
        ),
      ],
    );
  }
}
