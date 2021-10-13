import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/painter_provider.dart';
import 'package:notes_app/ui/painter_page/widgets/custom_button_widget.dart';
import 'package:notes_app/ui/painter_page/widgets/picker_color_widget.dart';
import 'package:provider/provider.dart';

class DrawBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PainterProvider>(builder: (context, provider, x) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Slider(
              value: provider.painterController.thickness,
              onChanged: (double value) => provider.setThickness(value),
              min: 1.0,
              max: 20.0,
              activeColor: Color(AppThemeData.theme.colorHexPrimary),
              inactiveColor:
                  Color(AppThemeData.theme.colorHexPrimary).withOpacity(0.18),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomButtonWidget(
                icon: Icons.crop_square,
                tooltip: 'Eraser',
                onTap: () => provider.painterController.eraseMode = true),
          ),
          Expanded(
            flex: 1,
            child: CustomButtonWidget(
                icon: Icons.create,
                tooltip: 'Pen',
                onTap: () => provider.painterController.eraseMode = false),
          ),
          Expanded(flex: 1, child: ColorPickerButton(false)),
          Expanded(flex: 1, child: ColorPickerButton(true)),
        ],
      );
    });
  }
}
