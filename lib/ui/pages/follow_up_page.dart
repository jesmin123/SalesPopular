import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/follow_up_widget.dart';

class FollowUpPage extends StatefulWidget {
  @override
  _FollowUpPageState createState() => _FollowUpPageState();
}

class _FollowUpPageState extends State<FollowUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(FOLLOW_UP),
      backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return FollowUpWidget() ;
            }
             ),
      ),
    );
  }
}
