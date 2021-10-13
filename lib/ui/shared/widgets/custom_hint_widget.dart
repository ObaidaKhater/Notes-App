import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHintWidget extends StatelessWidget {
  IconData icon;
  String hintText;

  CustomHintWidget({@required this.icon, @required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 80.w,vertical: 30.h),
        child: Column(
          children: [
            Icon(
              this.icon,
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              size: 55.r,
            ),
            SizedBox(height: 5.h,),
            Text(
              this.hintText,
              textAlign: TextAlign.center,
              style: AppThemeData.theme.hintTextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
