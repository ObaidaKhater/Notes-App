import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/theme_data.dart';

class CustomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
      child: Text(
        'Notes',
        style: AppThemeData.theme.titleHomePageTextStyle(),
      ),
    );
  }
}
