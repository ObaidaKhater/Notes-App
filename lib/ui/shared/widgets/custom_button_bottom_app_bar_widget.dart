import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/theme_data.dart';

class CustomButtonBottomAppBarWidget extends StatelessWidget {
  Function onTap;
  String imagePath;
  double size;

  CustomButtonBottomAppBarWidget(
      {@required this.onTap, @required this.imagePath,this.size});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: this.onTap,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.asset(
        this.imagePath,
        width: (size == null)?27.w:this.size.w,
        height: (size == null)?27.h:this.size.h,
        color: Color(AppThemeData.theme.colorHexPrimary).withOpacity(0.9),
      ),
    );
  }
}
