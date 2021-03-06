import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
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
              onTap: () {},
              iconPath: 'assets/icons/camera_icon.png',
              size: 25,
            ),
            CustomItemButtonMenuWidget(
              title: 'Add image',
              onTap: () {},
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
            CustomItemButtonMenuWidget(
                title: 'Add Checkbox',
                onTap: () {},
                iconPath: 'assets/icons/check_icon.png'),
          ],
        ),
      ),
    );
  }
}
