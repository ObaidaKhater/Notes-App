import 'package:flutter/material.dart';

class AddUpdateNotePage extends StatefulWidget {
  @override
  _AddUpdateNotePageState createState() => _AddUpdateNotePageState();
}

class _AddUpdateNotePageState extends State<AddUpdateNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
            )
          ],
        ),
      ),
    );
  }
}
