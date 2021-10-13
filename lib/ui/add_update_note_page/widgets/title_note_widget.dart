import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
        child: TextFormField(
          controller: provider.titleController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: AppThemeData.theme.titleNotePageTextStyle(),
          decoration: InputDecoration(
            hintText: 'Title',
            hintStyle: AppThemeData.theme.titleNotePageTextStyle(),
            border: InputBorder.none,
          ),
        ),
      );
    });
  }
}
