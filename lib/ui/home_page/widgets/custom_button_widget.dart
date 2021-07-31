import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  Function onPressed;
  IconData icon;

  CustomButtonWidget({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: this.onPressed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Icon(
        this.icon,
        color: Theme.of(context).primaryColor,
        size: 26.r,
      ),
    );
  }
}
