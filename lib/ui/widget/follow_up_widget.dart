
import 'package:ff_contact_avatar/ff_contact_avatar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/app_border_style.dart';
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
          title: Text(CASE_PUNCHED_ON, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
          trailing: Text("11 OCT 2020", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(LAST_CALL_ON, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text("18 OCT 2020", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(LineIcons.trash_o, color: APP_RED_COLOR, size: ICON_SIZE,),
            Text(DELETE_CASE, style: AppFontStyle.bodyTextStyle(APP_RED_COLOR),),
            SizedBox(width: LINE_HEIGHT,),
            Icon(LineIcons.clock_o, color: APP_RED_COLOR, size: 20,),
            Text(SCHEDULE_LATER, style: AppFontStyle.regularTextStyle3(APP_RED_COLOR),),
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
