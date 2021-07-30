import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_bottom_app_bar_note_page_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
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
      backgroundColor:Color( NoteData.noteData.colorHexCode),
      bottomNavigationBar: CustomBottomAppBarNotePageWidget(numCharacters,toggleColorNote),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color( NoteData.noteData.colorHexCode),
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
                style: titleTextStyle(),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: titleTextStyle(),
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
                style: descriptionTextStyle(),
                decoration: InputDecoration(
                  hintText: 'The Note ...',
                  hintStyle: descriptionTextStyle(),
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

  TextStyle descriptionTextStyle() => TextStyle(
        color: Color(0xFF828A9B),
        fontSize: 18,
      );

  TextStyle titleTextStyle() => TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
      );
}
