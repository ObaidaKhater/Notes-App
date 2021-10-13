import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/home_page/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_drawar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_floating_action_button_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_gridview_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_search_box_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).currentCategoryId = null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, x) {
      return Scaffold(
        floatingActionButton: CustomFloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        backgroundColor: Color(AppThemeData.theme.colorHexBackground),
        bottomNavigationBar: CustomBottomAppBarWidget(),
        key: scaffoldKey,
        drawer: CustomDrawerWidget(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(),
              CustomSearchBoxWidget(scaffoldKey),
              CustomGridviewWidget()
            ],
          ),
        ),
      );
    });
  }
}
