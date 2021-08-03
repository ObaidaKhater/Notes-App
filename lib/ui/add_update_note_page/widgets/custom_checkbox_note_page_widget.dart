import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

class CustomCheckBoxNotePageWidget extends StatefulWidget {
  ItemCheck itemCheck;
  Function toggleOnNotePage;

  CustomCheckBoxNotePageWidget(
      {@required this.itemCheck, @required this.toggleOnNotePage});

  @override
  _CustomCheckBoxNotePageWidgetState createState() =>
      _CustomCheckBoxNotePageWidgetState();
}

class _CustomCheckBoxNotePageWidgetState
    extends State<CustomCheckBoxNotePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Transform.scale(
              scale: 1.1.r,
              child: Checkbox(
                  side: BorderSide(
                    width: 1.r,
                    color: (NoteData.noteData.colorHexCode !=
                        AppThemeData.theme.colorHexCard)
                        ? Color(AppThemeData.theme.colorHexDescriptionLight)
                        : Color(AppThemeData.theme.colorHexDescriptionDark),
                  ),
                  checkColor: (NoteData.noteData.colorHexCode !=
                      AppThemeData.theme.colorHexCard)
                      ? Color(AppThemeData.theme.colorHoxBlack)
                      : Color(AppThemeData.theme.colorHexPrimary),
                  fillColor: (NoteData.noteData.colorHexCode !=
                      AppThemeData.theme.colorHexCard)
                      ? MaterialStateProperty.all<Color>(
                    Color(AppThemeData.theme.colorHexPrimary),
                  )
                      : MaterialStateProperty.all<Color>(
                    Color(AppThemeData.theme.colorHexBlue),
                  ),
                  value: widget.itemCheck.isDone,
                  shape: CircleBorder(),
                  onChanged: (newValue) {
                    widget.itemCheck.isDone = newValue;
                    setState(() {});
                  }),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: widget.itemCheck.title,
              style: AppThemeData.theme.descriptionNotePageTextStyle(),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) => widget.itemCheck.title = value,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomButtonBottomAppBarWidget(
              heroTag: 'deleteCheckBox' + widget.itemCheck.title,
              imagePath: 'assets/icons/delete_icon.png',
              onTap: () {
                NoteData.noteData.itemsCheck.removeAt(1);
                print(NoteData.noteData.itemsCheck);
                print(widget.itemCheck.title+' < ---------------------------------');
                widget.toggleOnNotePage();
              },
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
