import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/add_check_box_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/category_box_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_bottom_app_bar_note_page_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_checkbox_note_page_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/description_note_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/image_note_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/title_note_widget.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';

enum ActionOnPage { EDIT, ADD }

class AddUpdateNotePage extends StatelessWidget {
  static final String addRouteName = 'addNote';
  static final String editRouteName = 'editNote';
  ActionOnPage actionOnPage;

  AddUpdateNotePage({
    @required this.actionOnPage,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Color(provider.colorHexCode),
        bottomNavigationBar: CustomBottomAppBarNotePageWidget(
            this.actionOnPage),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(provider.colorHexCode),
          actions: [
            CustomIconButtonWidget(
                imagePath: 'assets/icons/done_icon.png',
                size: 20,
                onTap: () {
                  (actionOnPage == ActionOnPage.ADD)
                      ? provider.addNote()
                      : provider.updateNote();
                })
          ],
          leading: CustomIconButtonWidget(
            onTap: () => RouteHelper.routeHelper.pop(),
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
                // Draw Image ..................
                (provider.imagePath != null) ? ImageNoteWidget() : Container(),
                // Draw Title .................
                TitleNoteWidget(),
                // Draw Description .................
                DescriptionNoteWidget(),
                // Draw List CheckBox.................
                (provider.itemsCheck != null)
                    ? Column(
                  children: provider.itemsCheck
                      .map((itemCheck) =>
                      CustomCheckBoxNotePageWidget(
                        itemCheck: itemCheck,
                      ))
                      .toList(),
                )
                    : Container(),
                // Draw Add New CheckBox.................
                (provider.isShowAddCheckBox)
                    ? AddCheckBoxWidget()
                    : Container(),
                // Draw Category.................
                (provider.category != null) ? CategoryBoxWidget() : Container(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      );
    });
  }
}
