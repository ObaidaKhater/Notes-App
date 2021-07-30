import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_add_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_more_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_text_bottom_app_bar_widget.dart';

import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomAppBarNotePageWidget extends StatelessWidget {
  int numCharacters;
  Function toggleColorNote;

  CustomBottomAppBarNotePageWidget(this.numCharacters, this.toggleColorNote);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: BottomAppBar(
        elevation: 0,
        color: Color(NoteData.noteData.colorHexCode),
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButtonBottomAppBarWidget(
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => CustomAddMenuWidget()),
                imagePath: 'assets/icons/add_icon.png',
                size: 22,
              ),
              CustomTextBottomAppBarWidget(numCharacters),
              CustomButtonBottomAppBarWidget(
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        CustomMoreMenuWidget(toggleColorNote)),
                imagePath: 'assets/icons/menu_icon.png',
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
