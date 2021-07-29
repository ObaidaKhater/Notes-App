import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  bool isDone;
  String title;
  int colorHexCode;
  int numLinesTitle;
  TextOverflow textOverflowType;

  CustomCheckBoxWidget({
    @required this.isDone,
    @required this.title,
    @required this.colorHexCode,
    @required this.numLinesTitle,
    @required this.textOverflowType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 20.w,
            height: 20.h,
            child: Checkbox(
                side: BorderSide(
                  width: 1,
                  color: (this.colorHexCode != null)
                      ? Color(0xFFC1D3FF)
                      : Color(0xFF828A9B),
                ),
                checkColor: (this.colorHexCode != null)
                    ? Colors.black
                    : Theme.of(context).primaryColor,
                fillColor: (this.colorHexCode != null)
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).buttonColor),
                value: this.isDone,
                shape: CircleBorder(),
                onChanged: null)),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
            child: Text(
          this.title,
          maxLines: this.numLinesTitle,
          overflow: this.textOverflowType,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: (this.colorHexCode != null)
                ? Color(0xFFC1D3FF)
                : Color(0xFF828A9B),
            decoration: (this.isDone) ? TextDecoration.lineThrough : null,
          ),
        )),
      ],
    );
  }
}
