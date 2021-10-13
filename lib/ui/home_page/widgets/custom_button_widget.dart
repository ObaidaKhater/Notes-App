import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  Function onPressed;
  IconData icon;

  CustomButtonWidget({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.onPressed,
      iconSize: 26.r,
      color: Theme.of(context).primaryColor,
      icon: Icon(this.icon, color: Theme.of(context).primaryColor),
    );
  }
}
