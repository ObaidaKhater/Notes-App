import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';

class CustomBottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, x) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomAppBar(
          elevation: 40,
          color: Color(AppThemeData.theme.colorHexCard),
          shape: CircularNotchedRectangle(),
          child: Container(
            margin: EdgeInsets.only(right: 115.w, bottom: 10.h, left: 15.w),
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomIconButtonWidget(
                  imagePath: 'assets/icons/check_icon.png',
                  onTap: () => provider.addNewNoteWithCheckBox(),
                ),
                CustomIconButtonWidget(
                  onTap: () => provider.addNewNoteWithPainter(),
                  imagePath: 'assets/icons/brush_icon.png',
                ),
                CustomIconButtonWidget(
                  onTap: () => provider.addNewNoteWithImage(ImageSource.camera),
                  imagePath: 'assets/icons/camera_icon.png',
                ),
                CustomIconButtonWidget(
                  onTap: () => provider.addNewNoteWithImage(ImageSource.gallery),
                  imagePath: 'assets/icons/image_icon.png',
                  size: 20,
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
