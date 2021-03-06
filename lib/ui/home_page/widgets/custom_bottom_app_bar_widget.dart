import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_button_widget.dart';

class CustomBottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: BottomAppBar(
        elevation: 40,
        color: Color(AppThemeData.theme.colorHexCard),
        shape: CircularNotchedRectangle(),
        child: Container(
          margin: EdgeInsets.only(right: 115.w,bottom: 10.h,left: 15.w),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButtonBottomAppBarWidget(onPressed: (){}, imagePath: 'assets/icons/check_icon.png'),
              CustomButtonBottomAppBarWidget(onPressed: (){}, imagePath: 'assets/icons/mic_icon.png'),
              CustomButtonBottomAppBarWidget(onPressed: (){}, imagePath: 'assets/icons/camera_icon.png'),
              CustomButtonBottomAppBarWidget(onPressed: (){}, imagePath: 'assets/icons/brush_icon.png'),
            ],
          ),
        ),
      ),
    );
  }
}
