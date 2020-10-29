import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';

class MoqademaScreen extends StatelessWidget {
  final String pageTitle;
  final String textTitle;
  final String pageText;

  const MoqademaScreen(
      {@required this.pageTitle,
      @required this.textTitle,
      @required this.pageText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc8e6c9),
      appBar: AppBar(
        backgroundColor: Color(0xFF1b5e20),
        title: Text(getTranslated(context, pageTitle)),
        actions: <Widget>[],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: ListView(
          children: <Widget>[
            Text(
              getTranslated(context, textTitle),
              textDirection: TextDirection.rtl,
              // DemoLocalization.of(context).translate('personal_information'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getTranslated(context, pageText),

              // DemoLocalization.of(context).translate('personal_information'),
              // textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
