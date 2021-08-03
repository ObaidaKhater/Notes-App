import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/file_helper.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddMenuWidget extends StatelessWidget {
  Function toggleShowAddCheckBoxIcon;
  bool isShowAddCheckBoxIcon;
  Function toggleOnNotePage;

  CustomAddMenuWidget(this.toggleShowAddCheckBoxIcon,
      this.isShowAddCheckBoxIcon, this.toggleOnNotePage,);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (!this.isShowAddCheckBoxIcon)
          ? MediaQuery
          .of(context)
          .size
          .height * 0.5
          : MediaQuery
          .of(context)
          .size
          .height * 0.4,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      decoration: BoxDecoration(
        color: Color(NoteData.noteData.colorHexCode),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomItemButtonMenuWidget(
              title: 'Take a picture',
              onTap: () async {
                NavigatorHelper.navigatorHelper.pop();
                File file = await FileHelper.fileHelper.getImage(
                    ImageSource.camera,NoteData.noteData.title+Random().nextInt(10000).toString());
                NoteData.noteData.imagePath = file.path;
                this.toggleOnNotePage();
              },
              iconPath: 'assets/icons/camera_icon.png',
              size: 25,
            ),
            CustomItemButtonMenuWidget(
              title: 'Add image',
              onTap: () async{
                NavigatorHelper.navigatorHelper.pop();
                File file = await FileHelper.fileHelper.getImage(
                    ImageSource.gallery,NoteData.noteData.title+Random().nextInt(10000).toString());
                NoteData.noteData.imagePath = file.path;
                this.toggleOnNotePage();
              },
              iconPath: 'assets/icons/image_icon.png',
              size: 21,
            ),
            CustomItemButtonMenuWidget(
              title: 'Sketch',
              onTap: () {},
              iconPath: 'assets/icons/brush_icon.png',
            ),
            CustomItemButtonMenuWidget(
              title: 'Voice recording',
              onTap: () {},
              iconPath: 'assets/icons/mic_icon.png',
            ),
            (!this.isShowAddCheckBoxIcon)
                ? CustomItemButtonMenuWidget(
                title: 'Add Checkbox',
                onTap: () {
                  this.toggleShowAddCheckBoxIcon(
                      this.isShowAddCheckBoxIcon);
                  // Close Menu
                  NavigatorHelper.navigatorHelper.pop();
                },
                iconPath: 'assets/icons/check_icon.png')
                : Container(),
          ],
        ),
      ),
    );
  }
}
