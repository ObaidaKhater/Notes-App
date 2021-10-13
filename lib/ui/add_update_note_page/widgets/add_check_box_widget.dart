import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCheckBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Container(
        margin: EdgeInsets.only(left: 25.w, top: 10.h),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                controller: provider.checkboxController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                decoration: InputDecoration(
                    hintText: 'Add new checkbox',
                    hintStyle: AppThemeData.theme.hintAddCheckBoxTextField(),
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomIconButtonWidget(
                onTap: () => provider.addCheckBoxToPage(),
                imagePath: 'assets/icons/add_icon.png',
                size: 20,
              ),
            ),
          ],
        ),
      );
    });
  }
}
