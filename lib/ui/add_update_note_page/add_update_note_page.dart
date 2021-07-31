import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_bottom_app_bar_note_page_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_checkbox_note_page_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_checkbox_home_page_widget.dart';

enum ActionOnPage { EDIT, ADD }

class AddUpdateNotePage extends StatefulWidget {
  ActionOnPage actionOnPage;
  Note note;

  AddUpdateNotePage({@required this.actionOnPage, this.note});

  @override
  _AddUpdateNotePageState createState() => _AddUpdateNotePageState();
}

class _AddUpdateNotePageState extends State<AddUpdateNotePage> {
  int _numCharacters = 0;
  TextEditingController _titleController;
  TextEditingController _desController;

  toggleColorNote() => setState(() {});

  @override
  void initState() {
    super.initState();
    if (widget.actionOnPage == ActionOnPage.EDIT) {
      _titleController = TextEditingController(text: widget.note.title);
      _desController = TextEditingController(text: widget.note.description);
      NoteData.noteData.title = widget.note.title;
      NoteData.noteData.description = widget.note.description;
      NoteData.noteData.imagePath = widget.note.imagePath;
      NoteData.noteData.category = widget.note.category;
      NoteData.noteData.colorHexCode = widget.note.colorHexCode;
      NoteData.noteData.itemsCheck = widget.note.itemsCheck;
    } else {
      _titleController = TextEditingController();
      _desController = TextEditingController();
      NoteData.noteData.title = '';
      NoteData.noteData.description = null;
      NoteData.noteData.imagePath = null;
      NoteData.noteData.category = null;
      NoteData.noteData.colorHexCode = AppThemeData.theme.colorHexCard;
      NoteData.noteData.itemsCheck = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(NoteData.noteData.colorHexCode),
      bottomNavigationBar:
          CustomBottomAppBarNotePageWidget(_numCharacters, toggleColorNote),
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
          child: Column(
            children: [
              // Draw Image --------------------------------------------------------
              (NoteData.noteData.imagePath != null)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        NoteData.noteData.imagePath,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),

              // Draw Title --------------------------------------------------------
              Container(
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                child: TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: AppThemeData.theme.titleNotePageTextStyle(),
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: AppThemeData.theme.titleNotePageTextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // Draw Description --------------------------------------------------------
              Container(
                margin: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 10.h),
                child: TextFormField(
                  controller: _desController,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    _numCharacters = value.length;
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
              ),

              // Draw List CheckBox --------------------------------------------------------
              (NoteData.noteData.itemsCheck != null)
                  ? Column(
                      children: NoteData.noteData.itemsCheck
                          .map((itemCheck) => CustomCheckBoxNotePageWidget(
                              itemCheck: itemCheck))
                          .toList(),
                    )
                  : Container(),

              // Draw Add New CheckBox --------------------------------------------------------
              Container(
                margin: EdgeInsets.only(left: 25.w,top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                        decoration: InputDecoration(
                            hintText: 'Add new category',
                            hintStyle: AppThemeData.theme.hintAddCheckBoxTextField(),
                            border: InputBorder.none),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButtonBottomAppBarWidget(
                        onPressed: (){},
                        imagePath: 'assets/icons/add_icon.png',
                        size: 20,
                      ),
                    ),
                  ],
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
