import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/providers/painter_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorPickerButton extends StatelessWidget {
  bool background;

  ColorPickerButton(this.background);

  @override
  Widget build(BuildContext context) {
    return Consumer<PainterProvider>(builder: (context, provider, x) {
      return IconButton(
          iconSize: 23.r,
          icon: Icon(
            (this.background) ? Icons.format_color_fill : Icons.brush,
            color: (this.background)
                ? provider.painterController.backgroundColor
                : provider.painterController.drawColor,
          ),
          tooltip:
              this.background ? 'Change background color' : 'Change draw color',
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
                    child: AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.only(top: 14.0.h, bottom: 4.h),
                      title: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                        tooltip: 'Done',
                        onPressed: () => Navigator.pop(context),
                      ),
                      content: Expanded(
                        child: ColorPicker(
                          pickerColor: (this.background)
                              ? provider.painterController.backgroundColor
                              : provider.painterController.drawColor,
                          onColorChanged: (Color newColor) =>
                              provider.setNewColor(this.background, newColor),
                        ),
                      ),
                    ),
                  );
                });
          });
    });
  }
}
