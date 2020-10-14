import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/model/UserData.dart';
import 'package:sales_popular/model/UserData.dart';
import 'package:sales_popular/model/UserData.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:sales_popular/ui/widget/cases_item_widget.dart';
import '../../provider/cases_provider.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/booking_details_entry_form.dart';
import 'package:sales_popular/ui/widget/customer_detail_entry_form.dart';
import 'package:sales_popular/ui/widget/new_car_detail_entry_form.dart';
import 'package:sales_popular/ui/widget/old_car_details_entry_form.dart';

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
                child: userDataProvider.isLoading?Visibility(child: CircularProgressIndicator()):Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: LINE_HEIGHT,),
                    CircleAvatar(backgroundImage: CachedNetworkImageProvider('https://www.adbasis.com/images/divita-a65623c8.jpg'), maxRadius: CIRCLE_AVATAR_RADIUS,),
                    SizedBox(height: LINE_HEIGHT,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(PERSONAL_DETAILS, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                        InkWell(
                          onTap: ()=>onItemPressed(),
                          child: Row(
                            children: [
                              Icon(LineIcons.edit, size: ICON_SIZE_EDIT,),
                              Text(EDIT, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR),)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    ListTile(
                      title: Text(NAME, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getName(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(PHONE_NO, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getMobileNo(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(EMP_ID, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getEmpId(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(USER_NAME, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getUserName(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(BRANCH_DETAILS, style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                        InkWell(
                          onTap: ()=>onItemPressed(),
                          child: Row(
                            children: [
                              Icon(LineIcons.edit, size: ICON_SIZE_EDIT,),
                              Text(EDIT, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR),)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    ListTile(
                      title: Text(BRANCH_NAME, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getBranchName(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(BRANCH_CODE, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getBranchCode(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(USER_ID, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getUserId(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(DEPARTMENT, style: AppFontStyle.regularTextStyle2(APP_BLACK_COLOR,)),
                      subtitle: Text(userDataProvider.userData.getDepartment(), style: AppFontStyle.bodyTextStyle2(APP_GREY_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT,),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(width: .6,color:APP_RED_COLOR )),
                      child: ListTile(
                        trailing: Icon(LineIcons.key,color: Colors.red,),
                        title: Text(CHANGE_PASSWORD, style: AppFontStyle.regularTextStyle2(APP_RED_COLOR,)),
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
