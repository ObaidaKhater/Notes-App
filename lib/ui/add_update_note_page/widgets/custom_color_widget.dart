import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

class CustomColorWidget extends StatelessWidget {
  int coloHexCode;
  Function onTap;

  CustomColorWidget({@required this.coloHexCode, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return GestureDetector(
        onTap: this.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          width: 45.w,
          height: 45.h,
          child: (this.coloHexCode == provider.colorHexCode)
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.black.withOpacity(0.2), width: 5.w),
            color: Color(this.coloHexCode),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(this.coloHexCode).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 15,
                offset: Offset(0, 5),
              )
            ],
            shape: BoxShape.circle,
          ),
        ),
      );
    });
  }
}
