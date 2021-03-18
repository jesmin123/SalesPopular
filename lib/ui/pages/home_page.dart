import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/user_data_provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

@override
Widget build(BuildContext context) {

  UserDataProvider userDataProvider = Provider.of(context);
  EnquiryProvider enquiryProvider = Provider.of(context);
  return Scaffold(
    appBar:  AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(APP_NAME,style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR)),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    ),
    backgroundColor: APP_WHITE_COLOR,
    body: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: LINE_HEIGHT),
              Card(
                elevation: 4,
                child: ListTile(
                  onTap: ()=>naviagteToProfile(context),

                  leading: CircleAvatar( backgroundImage: CachedNetworkImageProvider('https://www.adbasis.com/images/divita-a65623c8.jpg'),maxRadius: CIRCLE_AVATAR_RADIUS*0.5),
                  title: Text("${userDataProvider.user.name}", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
                  subtitle: Text("EMP ID : ${userDataProvider.user.empId}", style: AppFontStyle.regularTextStyle4(APP_GREY_COLOR),),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              SizedBox(height: LINE_HEIGHT),
              cardWidget("Cases", "14",  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit",
                 Row(
                   children: [
                     button((){Navigator.pushNamed(context, ALL_ENQUIRY_PAGE);}, "View Case"),
                     SizedBox(width: 12,),
                     button((){Navigator.pushNamed(context, NEW_ENQUIRY_PAGE);}, "Add New"),
                   ],
                 )
              ),
              SizedBox(height: 12,),
              cardWidget("Delivery", "14",  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit",
                button((){Navigator.pushNamed(context, DELIVERY_PAGE);}, "View Delivary"),
              ),
          SizedBox(height: 12,),
          cardWidget("Delivery", "14",  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit",
            button((){Navigator.pushNamed(context, FOLLOW_UP_PAGE);}, "View Followup"))
            ],
          ),
        ),
      ),
    ),
  );
}

naviagteToProfile(BuildContext context) {
  Navigator.pushNamed(context, MY_PROFILE);
}

void naviagteToViewCase(BuildContext context) {
  Navigator.pushNamed(context, ALL_ENQUIRY_PAGE);
}

void naviagteToNewEnquiryPage(BuildContext context) {
  Navigator.pushNamed(context, NEW_ENQUIRY_PAGE);
}

void naviagteToViewDelivery(BuildContext context) {
  Navigator.pushNamed(context, DELIVERY_PAGE);
}

void naviagteToViewFollowUp(BuildContext context) {
  Navigator.pushNamed(context, FOLLOW_UP_PAGE);
}

Widget cardWidget(String cases, String number, String text, Widget widget){
  return Container(
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                child: Column(
                  children: [
                    Text(cases, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                    Text(number, style: AppFontStyle.ultraTextStyle(APP_BLACK_COLOR)),

                  ],
                ),
              ),
              VerticalDivider(thickness: 1.0,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text, style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
                      SizedBox(height:12,),
                      widget
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}

Widget button(Function function, String text){
  return  RaisedButton(
      color: PRIMARY_COLOR,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: function,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)),
          SizedBox(width: 2,),
          Icon(Icons.arrow_forward_ios_outlined, color: APP_WHITE_COLOR, size: 12,)
        ],
      )
  );
}

}