import 'package:flutter/material.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

class CustomItemDrawerWidget extends StatelessWidget {
  String title;
  String pathIcon;
  Function onTap;

  CustomItemDrawerWidget(
      {@required this.title, @required this.pathIcon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Row(
        children: [
          Text(
            this.title,
            style: AppThemeData.theme.titleCatDrawerTextStyle(),
          ),
          Spacer(),
          CustomButtonBottomAppBarWidget(
            imagePath: this.pathIcon,
            onPressed: null,
            size: 18,
          ),
        ],
      ),
    );
  }
}
