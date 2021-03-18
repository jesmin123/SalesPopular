

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/model/CaseModel.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUpWidget extends StatefulWidget {
  final CaseModel caseModel;

  FollowUpWidget(this.caseModel);

  @override
  _FollowUpWidgetState createState() => _FollowUpWidgetState();
}

class _FollowUpWidgetState extends State<FollowUpWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("${widget.caseModel.customerDetails.customerType}", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
        ),
        title: Text('${widget.caseModel.customerDetails.customerName}', style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
        subtitle: Text('${widget.caseModel.newCarDetails.carMake +" "+ widget.caseModel.newCarDetails.carModel}', style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR),),
      children: [
        ListTile(
          onTap: ()=>_callCustomer(widget.caseModel.customerDetails.mobileNo),
          title : Text("${widget.caseModel.customerDetails.mobileNo}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
          subtitle: Text("${widget.caseModel.customerDetails.village + ", " + widget.caseModel.customerDetails.district} ", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
          trailing: Icon(LineIcons.phone),
        ),
        Divider(),
//        ListTile(
//          title: Text(CASE_PUNCHED_ON, style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
//          trailing: Text("11 OCT 2020", style: AppFontStyle.regularTextStyle4(APP_BLACK_COLOR)),
//        ),
//        ListTile(
//          title: Padding(
//            padding: const EdgeInsets.only(bottom: 32),
//            child: Text(LAST_CALL_ON, style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR)),
//          ),
//          trailing: Padding(
//            padding: const EdgeInsets.only(bottom: 32),
//            child: Text("18 OCT 2020", style: AppFontStyle.regularTextStyle4(APP_BLACK_COLOR)),
//          ),
//        ),
        Container(child: RaisedButton(
            onPressed: (){
          Navigator.pushNamed(context, NEW_FOLLOW);
        },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: PRIMARY_COLOR,
          child: Text("Update Cases", style: AppFontStyle.regularTextStyle(APP_WHITE_COLOR)),
        ),),
        SizedBox(height: 12,)

      ],
    );
  }

  void _callCustomer(String phone) async{
      var  url = 'tel://$phone';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

  }
}
