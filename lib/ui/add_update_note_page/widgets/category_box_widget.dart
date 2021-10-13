import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color:
                    (provider.colorHexCode != AppThemeData.theme.colorHexCard)
                        ? Color(AppThemeData.theme.colorHexDescriptionLight)
                        : Color(AppThemeData.theme.colorHexDescriptionDark),
              ),
            ),
            child: Text(
              provider.category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppThemeData.theme.titleCatNotePageTextStyle(),
            ),
          ),
          Transform.translate(
            offset: Offset(-10, 5),
            child: CustomIconButtonWidget(
              imagePath: 'assets/icons/close_icon.png',
              size: 13,
              onTap: () => provider.deleteCategoryFromNote(),
            ),
          )
        ],
      );
    });
  }
}
