import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:provider/provider.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.w,
      height: 58.h,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(AppThemeData.theme.colorHexBlue),
        child: Container(
          child: Icon(
            Icons.add,
            size: 30.r,
          ),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color:
                      Color(AppThemeData.theme.colorHexBlue).withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 40,
                  offset: Offset(0, 5)),
            ],
          ),
        ),
        onPressed: () =>
            Provider.of<HomeProvider>(context, listen: false).addNewNote(),
      ),
    );
  }
}
