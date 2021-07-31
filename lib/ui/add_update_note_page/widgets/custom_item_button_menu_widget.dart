import 'package:flutter/material.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemButtonMenuWidget extends StatelessWidget {
  String title;
  String iconPath;
  Function onTap;
  double size;

  CustomItemButtonMenuWidget(
      {@required this.title,
      @required this.iconPath,
      @required this.onTap,
      this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: ListTile(
        leading: CustomButtonBottomAppBarWidget(
          onPressed: null,
          imagePath: this.iconPath,
          size: this.size,
        ),
        title: Text(
          title,
          style: AppThemeData.theme.titleItemButtonMenuTextStyle(),
        ),
      ),
    );
  }
}
