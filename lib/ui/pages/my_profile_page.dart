import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  @override
  void initState() {
    super.initState();
    getSupportingData();
  }

  getSupportingData(){

    final UserDataProvider userDataProvider = Provider.of(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      userDataProvider.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    UserDataProvider userDataProvider = Provider.of(context);
    return Scaffold(
        appBar: MAppBar(MY_PROFILE_PAGE),
        backgroundColor: APP_WHITE_COLOR,
        body: SafeArea(

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: userDataProvider.isLoading?Visibility(child: CircularProgressIndicator()):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: LINE_HEIGHT,),
                    CircleAvatar(backgroundImage: CachedNetworkImageProvider('https://www.adbasis.com/images/divita-a65623c8.jpg'), maxRadius: CIRCLE_AVATAR_RADIUS,),
                    SizedBox(height: LINE_HEIGHT,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(PERSONAL_DETAILS, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      ],
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    ListTile(
                      title: Text(NAME, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text('${userDataProvider.user.name}', style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(EMP_ID, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text('${userDataProvider.user.empId}', style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(USER_NAME, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text('${userDataProvider.user.name}', style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(BRANCH_DETAILS, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                      ],
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    ListTile(
                      title: Text(BRANCH_CODE, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text('${userDataProvider.user.branchCode}', style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(DEPARTMENT, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text('${userDataProvider.user.department}', style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CHANGE_PASSWORD_PAGE);
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(width: .6,color:APP_RED_COLOR )),
                        child: ListTile(
                          trailing: Icon(LineIcons.key,color: Colors.red,),
                          title: Text(CHANGE_PASSWORD, style: AppFontStyle.regularTextStyle2(APP_RED_COLOR,)),
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      width: 180,
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Loging Out", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                                      SizedBox(height: LINE_HEIGHT*0.5,),
                                      Text("Are you sure you want to log out?", style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR), textAlign: TextAlign.center,),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel", style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),)
                                          ),
                                          VerticalDivider(width: 25,thickness: 16,),
                                          FlatButton(
                                              onPressed: (){
                                                Navigator.pushNamed(context, LOGIN_PAGE);
                                              },
                                              child: Text("Yes", style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),)
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                          },
                        color: PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Log Out", style: AppFontStyle.labelTextStyle(APP_WHITE_COLOR)),
                            SizedBox(width: LINE_HEIGHT*0.4,),
                            Icon(Icons.logout, color: APP_WHITE_COLOR, size: 18,)
                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: LINE_HEIGHT*4,),
                    Text(COPYRIGHT_POPULAR_MOTORS, style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR),)
                  ],
                ),
              ),
            ),
          ),
        )
    );

  }

  onItemPressed() {}
}
