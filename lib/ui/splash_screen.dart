import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/home_page/home_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      try {
        Provider.of<HomeProvider>(context, listen: false).goToHomePage();
      }catch(e){
        print(e.toString());
      }
    });
    return Scaffold(
      backgroundColor: Color(AppThemeData.theme.colorHexBackground),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Image.asset(
            'assets/icons/logo.png',
          ),
        ),
      ),
    );
  }
}
