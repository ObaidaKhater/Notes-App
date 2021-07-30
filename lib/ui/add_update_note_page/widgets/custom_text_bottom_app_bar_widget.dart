import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextBottomAppBarWidget extends StatelessWidget {
  int numCharacters;

  CustomTextBottomAppBarWidget(this.numCharacters);

  DateTime dateTime = DateTime.now();
  String day = DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toUpperCase();
  String time =  DateFormat('kk:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Text(
      day + ', ' + time +' | '+'$numCharacters characters',
      style: TextStyle(color: Color(0xFF828A9B),
      fontSize: 12.sp),
    );
  }
}
