import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  Function onPressed;

  CustomFloatingActionButtonWidget({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: this.onPressed,
      elevation: 0,
      backgroundColor: Theme.of(context).buttonColor,
      child: Container(
        child: Icon(
          Icons.add,
          size: 30.r,
        ),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Theme.of(context).buttonColor.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 40,
              offset: Offset(0, 5)),
        ]),
      ),
    );
  }
}
