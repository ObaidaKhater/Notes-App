import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_color_widget.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:provider/provider.dart';

class CustomMoreMenuWidget extends StatelessWidget {
  ActionOnPage actionOnPage;

  CustomMoreMenuWidget(this.actionOnPage);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Color(provider.colorHexCode),
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
                      onTap: () => provider
                          .changeColorNote(AppThemeData.theme.colorHexBlue),
                    ),
                    CustomColorWidget(
                      coloHexCode: AppThemeData.theme.colorHexPink,
                      onTap: () => provider
                          .changeColorNote(AppThemeData.theme.colorHexPink),
                    ),
                    CustomColorWidget(
                      coloHexCode: AppThemeData.theme.colorHexOrange,
                      onTap: () => provider
                          .changeColorNote(AppThemeData.theme.colorHexOrange),
                    ),
                    CustomColorWidget(
                      coloHexCode: AppThemeData.theme.colorHexCard,
                      onTap: () => provider
                          .changeColorNote(AppThemeData.theme.colorHexCard),
                    ),
                    CustomColorWidget(
                      coloHexCode: AppThemeData.theme.colorHexTeal,
                      onTap: () => provider
                          .changeColorNote(AppThemeData.theme.colorHexTeal),
                    ),
                  ],
                ),
              ),
              CustomItemButtonMenuWidget(
                title: 'Delete note',
                iconPath: 'assets/icons/delete_icon.png',
                size: 23,
                onTap: () => provider.deleteNote(this.actionOnPage),
              ),
              CustomItemButtonMenuWidget(
                title: 'Make a copy',
                onTap: () => provider.copyNote(),
                iconPath: 'assets/icons/copy_icon.png',
                size: 23,
              ),
              CustomItemButtonMenuWidget(
                title: 'Share',
                onTap: () => provider.shareNote(),
                iconPath: 'assets/icons/share_icon.png',
                size: 22,
              ),
              CustomItemButtonMenuWidget(
                title: 'Categories',
                onTap: () => provider.setCategory(),
                iconPath: 'assets/icons/category_icon.png',
                size: 22,
              ),
            ],
          ),
        ),
      );
    });
  }
}
