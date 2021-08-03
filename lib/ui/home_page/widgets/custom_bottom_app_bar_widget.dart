import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/helpers/file_helper.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/ui/add_update_category_page/add_update_category_page.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_button_widget.dart';

class CustomBottomAppBarWidget extends StatelessWidget {
  Function toggleOnHomePage;

  CustomBottomAppBarWidget({@required this.toggleOnHomePage});

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
          margin: EdgeInsets.only(right: 115.w, bottom: 10.h, left: 15.w),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButtonBottomAppBarWidget(
                heroTag: 'addCheckBottomHomePage',
                imagePath: 'assets/icons/check_icon.png',
                onTap: () => NavigatorHelper.navigatorHelper
                    .pushAddNoteWithCheckBoxOnNotePage(this.toggleOnHomePage),
              ),
              CustomButtonBottomAppBarWidget(
                heroTag: 'micBottomHomePage',
                onTap: () {},
                imagePath: 'assets/icons/mic_icon.png',
              ),
              CustomButtonBottomAppBarWidget(
                heroTag: 'cameraBottomHomePage',
                onTap: () async {
                  File file = await FileHelper.fileHelper.getImage(
                      ImageSource.camera, Random().nextInt(10000).toString());
                  NavigatorHelper.navigatorHelper
                      .pushAddNoteWithImageOnNotePage(
                          toggleOnHomePage, file.path);
                },
                imagePath: 'assets/icons/camera_icon.png',
              ),
              CustomButtonBottomAppBarWidget(
                heroTag: 'brushBottomHomePage',
                onTap: () {},
                imagePath: 'assets/icons/brush_icon.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
