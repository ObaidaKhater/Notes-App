import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/painter_provider.dart';
import 'package:notes_app/ui/painter_page/widgets/custom_button_widget.dart';
import 'package:notes_app/ui/painter_page/widgets/draw_bar_widget.dart';
import 'package:painter/painter.dart';
import 'package:provider/provider.dart';

class PainterPage extends StatefulWidget {
  static final String routeNameFromHome = 'PainterHomePage';
  static final String routeNameFromNote = 'PainterNotePage';
  bool fromHomePage;


  PainterPage(this.fromHomePage);

  @override
  _PainterPageState createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
 @override
  void initState() {
    super.initState();
    Provider.of<PainterProvider>(context,listen: false).setPainterController();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PainterProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Color(AppThemeData.theme.colorHexBackground),
        appBar: AppBar(
            backgroundColor: Color(AppThemeData.theme.colorHexBackground),
            leading: CustomButtonWidget(
              onTap:()=> RouteHelper.routeHelper.pop(),
              tooltip:'Back' ,
              icon: Icons.arrow_back,
            ),
            actions: [
              CustomButtonWidget(
                icon: Icons.undo,
                tooltip: 'Undo',
                onTap: () {
                  if (provider.painterController.isEmpty) {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            new Text('Nothing to undo'));
                  } else {
                    provider.painterController.undo();
                  }
                },
              ),
              CustomButtonWidget(
                  icon: Icons.delete,
                  tooltip: 'Clear',
                  onTap: provider.painterController.clear),
              CustomButtonWidget(
                icon: Icons.check,
                tooltip: 'Done',
                onTap: () => provider.setPainterImageToNote(widget.fromHomePage),
              ),
            ],
            bottom: PreferredSize(
              child: DrawBar(),
              preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
            )),
        body: Container(
            height: double.infinity,
            width:double.infinity ,
            child: new AspectRatio(
                aspectRatio: 1.0,
                child: new Painter(provider.painterController))),
      );
    });
  }
}


