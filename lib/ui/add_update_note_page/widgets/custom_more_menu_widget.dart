import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/helpers/share_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_color_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/choose_category_page/choose_category_page.dart';
import 'package:notes_app/data/theme_data.dart';

class CustomMoreMenuWidget extends StatefulWidget {
  Function toggleOnNotePage;
  ActionOnPage actionOnPage;
  Note note;

  CustomMoreMenuWidget(this.toggleOnNotePage, this.note, this.actionOnPage);

  @override
  _CustomMoreMenuWidgetState createState() => _CustomMoreMenuWidgetState();
}

class _CustomMoreMenuWidgetState extends State<CustomMoreMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Color(NoteData.noteData.colorHexCode),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomColorWidget(
                      coloHexCode: AppThemeData.theme.colorHexBlue,
                      onTap: () {
                        NoteData.noteData.colorHexCode =
                            AppThemeData.theme.colorHexBlue;
                        this.widget.toggleOnNotePage();
                        setState(() {});
                      }),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexPink,
                    onTap: () {
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexPink;
                      this.widget.toggleOnNotePage();
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexOrange,
                    onTap: () {
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexOrange;
                      this.widget.toggleOnNotePage();
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexCard,
                    onTap: () {
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexCard;
                      this.widget.toggleOnNotePage();
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexTeal,
                    onTap: () {
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexTeal;
                      this.widget.toggleOnNotePage();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            CustomItemButtonMenuWidget(
              title: 'Delete note',
              iconPath: 'assets/icons/delete_icon.png',
              size: 23,
              onTap: () async {
                if (this.widget.actionOnPage == ActionOnPage.EDIT) {
                  DbHelper.dbHelper.deleteNote(this.widget.note.id);
                  NavigatorHelper.navigatorHelper.pop();
                  NavigatorHelper.navigatorHelper.pop();
                } else {
                  NavigatorHelper.navigatorHelper.pop();
                  NavigatorHelper.navigatorHelper.pop();
                }
              },
            ),
            CustomItemButtonMenuWidget(
              title: 'Make a copy',
              onTap: () {
                ShareHelper.shareHelper.makeACopyContentNote(this.widget.note);
                NavigatorHelper.navigatorHelper.pop();
              },
              iconPath: 'assets/icons/copy_icon.png',
              size: 23,
            ),
            CustomItemButtonMenuWidget(
              title: 'Share',
              onTap: () {
                ShareHelper.shareHelper.shareContentNote(this.widget.note);
                NavigatorHelper.navigatorHelper.pop();
              },
              iconPath: 'assets/icons/share_icon.png',
              size: 22,
            ),
            CustomItemButtonMenuWidget(
              title: 'Categories',
              onTap: () async {
                await NavigatorHelper.navigatorHelper.pushChooseCategory();
                widget.toggleOnNotePage();
              },
              iconPath: 'assets/icons/category_icon.png',
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
