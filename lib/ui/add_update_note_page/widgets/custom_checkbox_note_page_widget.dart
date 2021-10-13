import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';

class CustomCheckBoxNotePageWidget extends StatelessWidget {
  ItemCheck itemCheck;

  CustomCheckBoxNotePageWidget({@required this.itemCheck});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
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
                      color: (provider.colorHexCode !=
                              AppThemeData.theme.colorHexCard)
                          ? Color(AppThemeData.theme.colorHexDescriptionLight)
                          : Color(AppThemeData.theme.colorHexDescriptionDark),
                    ),
                    checkColor: (provider.colorHexCode !=
                            AppThemeData.theme.colorHexCard)
                        ? Color(AppThemeData.theme.colorHoxBlack)
                        : Color(AppThemeData.theme.colorHexPrimary),
                    fillColor: (provider.colorHexCode !=
                            AppThemeData.theme.colorHexCard)
                        ? MaterialStateProperty.all<Color>(
                            Color(AppThemeData.theme.colorHexPrimary),
                          )
                        : MaterialStateProperty.all<Color>(
                            Color(AppThemeData.theme.colorHexBlue),
                          ),
                    value:this.itemCheck.isDone,
                    shape: CircleBorder(),
                    onChanged: (newValue) {
                      this.itemCheck.isDone = newValue;
                      provider.changeValueItemCheck();
                    }),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              flex: 3,
              child: TextFormField(
                initialValue: this.itemCheck.title,
                style: AppThemeData.theme
                    .textCheckBocNotePageTextStyle(this.itemCheck.isDone),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) => this.itemCheck.title = value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomIconButtonWidget(
                imagePath: 'assets/icons/delete_icon.png',
                onTap: () => provider.removeItemCheckBox(this.itemCheck),
                size: 17,
              ),
            ),
          ],
        ),
      );
    });
  }
}
