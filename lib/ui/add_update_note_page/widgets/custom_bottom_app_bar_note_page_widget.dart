import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_add_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_more_menu_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_text_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBottomAppBarNotePageWidget extends StatelessWidget {
  ActionOnPage actionOnPage;

  CustomBottomAppBarNotePageWidget(this.actionOnPage);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, provider, x) {
        return Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            elevation: 0,
            color: Color(provider.colorHexCode),
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomIconButtonWidget(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => CustomAddMenuWidget(),
                    ),
                    imagePath: 'assets/icons/add_icon.png',
                    size: 22,
                  ),
                  CustomTextBottomAppBarWidget(),
                  CustomIconButtonWidget(

                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => CustomMoreMenuWidget(this.actionOnPage)),
                    imagePath: 'assets/icons/menu_icon.png',
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
