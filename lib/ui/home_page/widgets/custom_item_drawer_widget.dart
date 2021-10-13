import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';

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
          Expanded(
            flex: 4,
            child: Text(
              this.title,
              style: AppThemeData.theme.titleCatDrawerTextStyle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomIconButtonWidget(
              imagePath: this.pathIcon,
              onTap: null,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
