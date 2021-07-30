import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_color_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/theme_data.dart';

class CustomMoreMenuWidget extends StatefulWidget {
  Function toggleColorNote;

  CustomMoreMenuWidget(this.toggleColorNote);

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
                        this.widget.toggleColorNote();
                        NoteData.noteData.colorHexCode =
                            AppThemeData.theme.colorHexBlue;
                        setState(() {});
                      }),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexPink,
                    onTap: () {
                      this.widget.toggleColorNote();
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexPink;
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexOrange,
                    onTap: () {
                      this.widget.toggleColorNote();
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexOrange;
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexDark,
                    onTap: () {
                      this.widget.toggleColorNote();
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexDark;
                      setState(() {});
                    },
                  ),
                  CustomColorWidget(
                    coloHexCode: AppThemeData.theme.colorHexTeal,
                    onTap: () {
                      this.widget.toggleColorNote();
                      NoteData.noteData.colorHexCode =
                          AppThemeData.theme.colorHexTeal;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            CustomItemButtonMenuWidget(
              title: 'Delete note',
              onTap: () {},
              iconPath: 'assets/icons/delete_icon.png',
              size: 23,
            ),
            CustomItemButtonMenuWidget(
              title: 'Make a copy',
              onTap: () {},
              iconPath: 'assets/icons/copy_icon.png',
              size: 23,
            ),
            CustomItemButtonMenuWidget(
              title: 'Share',
              onTap: () {},
              iconPath: 'assets/icons/share_icon.png',
              size: 22,
            ),
            CustomItemButtonMenuWidget(
              title: 'Categories',
              onTap: () {},
              iconPath: 'assets/icons/category_icon.png',
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
