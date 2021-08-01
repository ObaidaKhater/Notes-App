import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_bottom_app_bar_note_page_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_checkbox_note_page_widget.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

enum ActionOnPage { EDIT, ADD }

class AddUpdateNotePage extends StatefulWidget {
  ActionOnPage actionOnPage;
  Note note;
  bool isShowAddCheckBoxIcon;

  AddUpdateNotePage(
      {@required this.actionOnPage, this.note, this.isShowAddCheckBoxIcon});

  @override
  _AddUpdateNotePageState createState() => _AddUpdateNotePageState();
}

class _AddUpdateNotePageState extends State<AddUpdateNotePage> {
  int _numCharacters = 0;
  TextEditingController _titleController;
  TextEditingController _desController;
  TextEditingController _checkboxController;

  toggleOnNotePage() => setState(() {});

  toggleShowAddCheckBoxIcon(bool isShow) {
    widget.isShowAddCheckBoxIcon = !isShow;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.actionOnPage == ActionOnPage.EDIT) {
      _titleController = TextEditingController(text: widget.note.title);
      _desController = TextEditingController(text: widget.note.description);
      _checkboxController = TextEditingController();
      NoteData.noteData.title = widget.note.title;
      NoteData.noteData.description = widget.note.description;
      NoteData.noteData.imagePath = widget.note.imagePath;
      NoteData.noteData.category = widget.note.category;
      NoteData.noteData.colorHexCode = widget.note.colorHexCode;
      NoteData.noteData.itemsCheck = widget.note.itemsCheck;
      (widget.note.itemsCheck != null)
          ? widget.isShowAddCheckBoxIcon = true
          : widget.isShowAddCheckBoxIcon = false;
    } else {
      _titleController = TextEditingController();
      _desController = TextEditingController();
      _checkboxController = TextEditingController();
      NoteData.noteData.title = '';
      NoteData.noteData.description = null;
      NoteData.noteData.imagePath = null;
      NoteData.noteData.category = null;
      NoteData.noteData.colorHexCode = AppThemeData.theme.colorHexCard;
      NoteData.noteData.itemsCheck = null;
      (widget.isShowAddCheckBoxIcon == null)
          ? widget.isShowAddCheckBoxIcon = false
          : widget.isShowAddCheckBoxIcon = widget.isShowAddCheckBoxIcon;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _checkboxController.dispose();
    _desController.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(NoteData.noteData.colorHexCode),
      bottomNavigationBar: CustomBottomAppBarNotePageWidget(
          _numCharacters,
          toggleOnNotePage,
          toggleShowAddCheckBoxIcon,
          widget.isShowAddCheckBoxIcon),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(NoteData.noteData.colorHexCode),
        actions: [
          CustomButtonBottomAppBarWidget(
            heroTag: 'doneNoteAppbar',
            onTap: () {},
            imagePath: 'assets/icons/done_icon.png',
            size: 20,
          ),
        ],
        leading: CustomButtonBottomAppBarWidget(
          heroTag: 'backNoteAppbar',
          onTap: () => NavigatorHelper.navigatorHelper.pop(),
          imagePath: 'assets/icons/left_icon.png',
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Draw Image --------------------------------------------------------
              (NoteData.noteData.imagePath != null)
                  ? Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            NoteData.noteData.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButtonBottomAppBarWidget(
                            heroTag:'deleteImageNotePage',
                            imagePath: 'assets/icons/close_icon.png',
                            onTap: () {
                              NoteData.noteData.imagePath = null;
                              setState(() {});
                            },
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  : Container(),

              // Draw Title --------------------------------------------------------
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
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
                margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
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
                    hintStyle:
                        AppThemeData.theme.descriptionNotePageTextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // Draw List CheckBox --------------------------------------------------------
              (NoteData.noteData.itemsCheck != null)
                  ? Column(
                      children: NoteData.noteData.itemsCheck
                          .map((itemCheck) => CustomCheckBoxNotePageWidget(
                              itemCheck: itemCheck,
                              toggleOnNotePage: toggleOnNotePage))
                          .toList(),
                    )
                  : Container(),

              // Draw Add New CheckBox --------------------------------------------------------
              (widget.isShowAddCheckBoxIcon)
                  ? Container(
                      margin: EdgeInsets.only(left: 25.w, top: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: _checkboxController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: AppThemeData.theme
                                  .textSearchBoxHomePageTextStyle(),
                              decoration: InputDecoration(
                                  hintText: 'Add new checkbox',
                                  hintStyle: AppThemeData.theme
                                      .hintAddCheckBoxTextField(),
                                  border: InputBorder.none),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomButtonBottomAppBarWidget(
                              heroTag: 'addCheckBoxNotePage',
                              onTap: () {
                                if (NoteData.noteData.itemsCheck == null)
                                  NoteData.noteData.itemsCheck = [];
                                if (_checkboxController.text
                                    .trim()
                                    .isNotEmpty) {
                                  NoteData.noteData.itemsCheck.add(
                                    ItemCheck(
                                      title: _checkboxController.text.trim(),
                                      isDone: false,
                                    ),
                                  );
                                  _checkboxController.clear();
                                  setState(() {});
                                }
                              },
                              imagePath: 'assets/icons/add_icon.png',
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),

              // Draw Category --------------------------------------------------------
              (NoteData.noteData.category != null)
                  ? Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 30.h, left: 15.w, right: 15.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: (NoteData.noteData.colorHexCode !=
                                      AppThemeData.theme.colorHexCard)
                                  ? Color(AppThemeData
                                      .theme.colorHexDescriptionLight)
                                  : Color(AppThemeData
                                      .theme.colorHexDescriptionDark),
                            ),
                          ),
                          child: Text(
                            NoteData.noteData.category.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                AppThemeData.theme.titleCatNotePageTextStyle(),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-10, 5),
                          child: CustomButtonBottomAppBarWidget(
                            heroTag: 'deleteCateNotePage',
                            imagePath: 'assets/icons/close_icon.png',
                            size: 13,
                            onTap: () {
                              NoteData.noteData.category = null;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    )
                  : Container(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
