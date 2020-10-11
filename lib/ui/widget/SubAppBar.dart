
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double height = 50;

  final String _title;

  MAppBar(this._title,);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(_title,style: AppFontStyle.titleAppBarStyle(APP_BLACK_COLOR)),
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(LineIcons.arrow_circle_left,color: Colors.black,), onPressed: ()=>{Navigator.pop(context,true)})
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

}
