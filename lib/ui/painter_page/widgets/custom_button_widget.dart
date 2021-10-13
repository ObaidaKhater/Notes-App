import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  String tooltip;
  IconData icon;
  Function onTap;

  CustomButtonWidget(
      {@required this.tooltip, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 23.r,
      color: Theme.of(context).primaryColor,
      icon: Icon(this.icon, color: Theme.of(context).primaryColor),
      tooltip: this.tooltip,
      onPressed: this.onTap,
    );
  }
}
