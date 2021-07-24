import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
      child: Text(
        'Notes',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
