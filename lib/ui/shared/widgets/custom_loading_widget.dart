import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: CircularProgressIndicator()),
    );
  }
}
