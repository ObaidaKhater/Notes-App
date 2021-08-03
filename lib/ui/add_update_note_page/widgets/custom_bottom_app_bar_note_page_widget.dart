import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_add_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_more_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_text_bottom_app_bar_widget.dart';

import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomAppBarNotePageWidget extends StatelessWidget {
  int numCharacters;
  Function toggleOnNotePage;
  Function toggleShowAddCheckBoxIcon;
  bool isShowAddCheckBoxIcon;
  Note note;
  ActionOnPage actionOnPage;

  CustomBottomAppBarNotePageWidget(
      this.numCharacters,
      this.toggleOnNotePage,
      this.toggleShowAddCheckBoxIcon,
      this.isShowAddCheckBoxIcon,
      this.note,
      this.actionOnPage);

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
                heroTag: 'addMenu',
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => CustomAddMenuWidget(
                          this.toggleShowAddCheckBoxIcon,
                          this.isShowAddCheckBoxIcon,
                          this.toggleOnNotePage,
                        )),
                imagePath: 'assets/icons/add_icon.png',
                size: 22,
              ),
              CustomTextBottomAppBarWidget(numCharacters),
              CustomButtonBottomAppBarWidget(
                heroTag: 'moreMenu',
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => CustomMoreMenuWidget(
                        this.toggleOnNotePage, this.note, this.actionOnPage)),
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
