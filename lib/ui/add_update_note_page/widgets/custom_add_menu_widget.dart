import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/widgets/custom_item_button_menu_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomAddMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, provider, x) {
        return Container(
          height: (!provider.isShowAddCheckBox)
              ? MediaQuery.of(context).size.height * 0.42
              : MediaQuery.of(context).size.height * 0.32,
          padding: EdgeInsets.symmetric(vertical: 30.h),
          decoration: BoxDecoration(
            color: Color(provider.colorHexCode),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r),
                topRight: Radius.circular(35.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomItemButtonMenuWidget(
                  title: 'Take a picture',
                  onTap: () => provider.setImageToNote(ImageSource.camera),
                  iconPath: 'assets/icons/camera_icon.png',
                  size: 25,
                ),
                CustomItemButtonMenuWidget(
                  title: 'Add image',
                  onTap: () => provider.setImageToNote(ImageSource.gallery),
                  iconPath: 'assets/icons/image_icon.png',
                  size: 21,
                ),
                CustomItemButtonMenuWidget(
                  title: 'Sketch',
                  onTap: () => provider.addPainterToNote(),
                  iconPath: 'assets/icons/brush_icon.png',
                ),
                (!provider.isShowAddCheckBox)
                    ? CustomItemButtonMenuWidget(
                        title: 'Add Checkbox',
                        onTap: () => provider.showAddCheckBox(),
                        iconPath: 'assets/icons/check_icon.png',
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
