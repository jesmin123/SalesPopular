

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUpWidget extends StatefulWidget {
  @override
  _FollowUpWidgetState createState() => _FollowUpWidgetState();
}

class _FollowUpWidgetState extends State<FollowUpWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("10:00 AM", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
        ),
        title: Text("Mr. Ravi Aswin", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
        subtitle: Text("Maruti Suzuki Celerio", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR),),
      children: [
        ListTile(
          onTap: ()=>_callCustomer(),
          title : Text("+91 8921 664 155", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
          subtitle: Text("Pathanapuram, Kollam", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
          trailing: Icon(LineIcons.phone),
        ),
        Divider(),
        ListTile(
          title: Text(CASE_PUNCHED_ON, style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
          trailing: Text("11 OCT 2020", style: AppFontStyle.regularTextStyle4(APP_BLACK_COLOR)),
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(LAST_CALL_ON, style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text("18 OCT 2020", style: AppFontStyle.regularTextStyle4(APP_BLACK_COLOR)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(child: RaisedButton(onPressed: () {},child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(LineIcons.trash_o, color: APP_RED_COLOR, size: ICON_SIZE*1.3), SizedBox(width: TEXT_WIDTH*0.2), Expanded(child: Text(DROP_CASE, style: AppFontStyle.regularTextStyle4(APP_RED_COLOR),))],), color: APP_WHITE_COLOR,textColor: APP_RED_COLOR,),flex: 1),
            Flexible(child: RaisedButton(onPressed: () {Navigator.pushNamed(context, NEW_FOLLOW);},child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.access_alarm, color: APP_MAGANTA_COLOR, size: ICON_SIZE*1.3), SizedBox(width: TEXT_WIDTH*0.2), Expanded(child: Text(FOLLOW_UP,style: AppFontStyle.regularTextStyle4(APP_MAGANTA_COLOR),))],),color: APP_WHITE_COLOR,textColor: APP_MAGANTA_COLOR,),flex: 1),
            Flexible(child: RaisedButton(onPressed: () {},child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.drag_indicator, color: APP_GREEN_COLOR, size: ICON_SIZE*1.3), SizedBox(width: TEXT_WIDTH*0.2), Expanded(child: Text(POSTPONE, style: AppFontStyle.regularTextStyle4(APP_GREEN_COLOR),))],),color: APP_WHITE_COLOR,textColor: APP_GREEN_COLOR,),flex: 1)
          ],
        ),
      ],
    );
  }

  void _callCustomer() async{
      const url = 'tel://8921661155';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

  }
}
