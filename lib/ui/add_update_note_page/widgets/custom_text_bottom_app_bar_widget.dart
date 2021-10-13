import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';
class CustomTextBottomAppBarWidget extends StatelessWidget {

  DateTime dateTime = DateTime.now();
  String day = DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toUpperCase();
  String time =  DateFormat('kk:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Selector<NoteProvider,int>(
      builder: (context,data,x){
        return Text(
          day + ', ' + time +' | '+'$data characters',
          style: AppThemeData.theme.dateAndNumCharactersTextStyle(),
        );
      },
      selector: (context,provider) => provider.numCharactersNote,
    );
  }
}
