import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';

class FollowUpWidget extends StatefulWidget {
  @override
  _FollowUpWidgetState createState() => _FollowUpWidgetState();
}

class _FollowUpWidgetState extends State<FollowUpWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: Text("10:00 AM"),
        title: Text("Anoop", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
    );
  }
}
