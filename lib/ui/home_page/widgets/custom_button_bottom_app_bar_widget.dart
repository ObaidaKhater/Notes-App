import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonBottomAppBarWidget extends StatelessWidget {
  Function onPressed;
  String imagePath;

  CustomButtonBottomAppBarWidget(
      {@required this.onPressed, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: this.onPressed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.asset(
        this.imagePath,
        width: 28.w,
        height: 28.h,
        color: Theme.of(context).primaryColor.withOpacity(0.9),
      ),
    );
  }
}
