import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/theme_data.dart';

class CustomIconButtonWidget extends StatelessWidget {
  Function onTap;
  String imagePath;
  double size;

  CustomIconButtonWidget(
      {@required this.onTap,
      @required this.imagePath,
      this.size});

  final String x = null;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.onTap,
      icon: Image.asset(
        this.imagePath,
        width: (size == null) ? 27.w : this.size.w,
        height: (size == null) ? 27.h : this.size.h,
        color: Color(AppThemeData.theme.colorHexPrimary).withOpacity(0.9),
      ),
    );
  }
}
