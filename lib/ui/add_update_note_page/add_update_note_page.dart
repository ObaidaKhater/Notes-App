import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_bottom_app_bar_note_page_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

class AddUpdateNotePage extends StatefulWidget {
  @override
  _AddUpdateNotePageState createState() => _AddUpdateNotePageState();
}

class _AddUpdateNotePageState extends State<AddUpdateNotePage> {
  int numCharacters = 0;

  toggleColorNote() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(NoteData.noteData.colorHexCode),
      bottomNavigationBar:
          CustomBottomAppBarNotePageWidget(numCharacters, toggleColorNote),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(NoteData.noteData.colorHexCode),
        actions: [
          CustomButtonBottomAppBarWidget(
            onPressed: () {},
            imagePath: 'assets/icons/done_icon.png',
            size: 20,
          ),
        ],
        leading: CustomButtonBottomAppBarWidget(
          onPressed: () {},
          imagePath: 'assets/icons/left_icon.png',
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: AppThemeData.theme.titleNotePageTextStyle(),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: AppThemeData.theme.titleNotePageTextStyle(),
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  numCharacters = value.length;
                  setState(() {});
                },
                maxLines: null,
                style: AppThemeData.theme.descriptionNotePageTextStyle(),
                decoration: InputDecoration(
                  hintText: 'The Note ...',
                  hintStyle: AppThemeData.theme.descriptionNotePageTextStyle(),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

}
