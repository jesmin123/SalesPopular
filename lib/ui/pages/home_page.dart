import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar:  AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(APP_NAME,style: AppFontStyle.titleAppBarStyle(PRIMARY_COLOR)),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    ),
    backgroundColor: APP_WHITE_COLOR,
    body: SafeArea(
      child: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: LINE_HEIGHT),
            Card(
              elevation: 4,
              child: ListTile(
                onTap: ()=>naviagteToProfile(context),
                leading: CircleAvatar( backgroundImage: CachedNetworkImageProvider('https://www.adbasis.com/images/divita-a65623c8.jpg'),maxRadius: CIRCLE_AVATAR_RADIUS*0.5),
                title: Text("Ajit Kumar", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
                subtitle: Text("EMP ID : P456723", style: AppFontStyle.regularTextStyle4(APP_GREY_COLOR),),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            SizedBox(height: LINE_HEIGHT),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: APP_BLACK_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(CASES, style: AppFontStyle.regularTextStyle(APP_WHITE_COLOR), ),
                  ListTile(
                    leading: Text("14", style: AppFontStyle.ultraTextStyle(APP_WHITE_COLOR),) ,
                    title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit", style: AppFontStyle.regularTextStyle4(APP_WHITE_COLOR),),
                  ),
                  SizedBox(height: LINE_HEIGHT),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RaisedButton(onPressed: (){naviagteToViewCase(context);}, color: APP_WHITE_COLOR, shape: AppBorderStyle.appButtonShape(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(VIEW_CASE, style: AppFontStyle.buttonTextStyle(APP_BLACK_COLOR),),
                              SizedBox(width: TEXT_WIDTH,),
                              Icon(Icons.arrow_forward_ios_outlined, size: ARROW_RIGHT, color: APP_BLACK_COLOR,)
                            ],
                          ),),
                        SizedBox(width: LINE_HEIGHT),
                        RaisedButton(onPressed: (){naviagteToNewEnquiryPage(context);}, color: APP_WHITE_COLOR, shape: AppBorderStyle.appButtonShape(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(ADD_NEW, style: AppFontStyle.buttonTextStyle(APP_BLACK_COLOR),),
                              SizedBox(width: TEXT_WIDTH,),
                              Icon(Icons.arrow_forward_ios_outlined, size: ARROW_RIGHT, color: APP_BLACK_COLOR,)
                            ],
                          ),),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: APP_WHITE_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(DELIVERY, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR), ),
                  ListTile(
                    leading: Text("14", style: AppFontStyle.ultraTextStyle(APP_BLACK_COLOR),) ,
                    title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit", style: AppFontStyle.regularTextStyle4(APP_BLACK_COLOR),),
                  ),
                  SizedBox(height: LINE_HEIGHT),
                  Center(
                    child: RaisedButton(onPressed: (){naviagteToViewDelivery(context);}, color: APP_BLACK_COLOR, shape: AppBorderStyle.appButtonShape(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(VIEW_DELIVERY, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR),),
                          SizedBox(width: TEXT_WIDTH,),
                          Icon(Icons.arrow_forward_ios_outlined, size: ARROW_RIGHT, color: APP_WHITE_COLOR,)
                        ],
                      ),),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: APP_BLACK_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(FOLLOW_UP, style: AppFontStyle.regularTextStyle(APP_WHITE_COLOR), ),
                  ListTile(
                    leading: Text("14", style: AppFontStyle.ultraTextStyle(APP_WHITE_COLOR),) ,
                    title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit", style: AppFontStyle.regularTextStyle4(APP_WHITE_COLOR),),
                  ),
                  SizedBox(height: LINE_HEIGHT),
                  Center(
                    child: RaisedButton(onPressed: (){naviagteToViewFollowUp(context);}, color: APP_WHITE_COLOR, shape: AppBorderStyle.appButtonShape(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(VIEW_FOLLOW_UP, style: AppFontStyle.buttonTextStyle(APP_BLACK_COLOR),),
                          SizedBox(width: TEXT_WIDTH,),
                          Icon(Icons.arrow_forward_ios_outlined, size: ARROW_RIGHT, color: APP_BLACK_COLOR,)
                        ],
                      ),),
                  ),

                ],
              ),
            )
          ],
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
}