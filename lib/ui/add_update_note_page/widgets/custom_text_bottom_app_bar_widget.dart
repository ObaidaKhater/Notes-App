import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
class CustomTextBottomAppBarWidget extends StatelessWidget {
  int numCharacters;

  CustomTextBottomAppBarWidget(this.numCharacters);

  DateTime dateTime = DateTime.now();
  String day = DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toUpperCase();
  String time =  DateFormat('kk:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Text(
      day + ', ' + time +' | '+'$numCharacters characters',
      style: AppThemeData.theme.dateAndNumCharactersTextStyle(),
    );
  }
}
