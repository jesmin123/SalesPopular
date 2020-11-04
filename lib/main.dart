import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:sales_popular/ui/pages/change_password-page.dart';
import 'package:sales_popular/ui/pages/delivary_page.dart';
import 'package:sales_popular/ui/pages/follow_up_page.dart';
import 'package:sales_popular/ui/pages/login_page.dart';
import 'package:sales_popular/ui/pages/my_profile_page.dart';
import 'package:sales_popular/ui/pages/home_page.dart';
import './provider/cases_provider.dart';
import './provider/enquiry_provider.dart';
import './provider/form_data_provider.dart';
import './ui/pages/all_enquiry_page.dart';
import './ui/pages/new_enquiry_page.dart';
import './constants/colors.dart';
import './constants/strings.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final routes = <String,WidgetBuilder>{
    HOME_PAGE: (context)=>HomePage(),
    NEW_ENQUIRY_PAGE: (context)=>NewEnquiryPage(),
    ALL_ENQUIRY_PAGE : (context)=>AllEnquiryPage(),
    MY_PROFILE : (context)=>MyProfilePage(),
    DELIVERY_PAGE : (context)=>DeliveryPage(),
    FOLLOW_UP_PAGE : (context)=>FollowUpPage(),
    LOGIN_PAGE : (context)=>LogInPage(),
    CHANGE_PASSWORD_PAGE :(context)=>ChangePasswordPage()
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormData>(create: (_)=>FormData()),
        ChangeNotifierProvider<EnquiryProvider>(create: (_)=>EnquiryProvider()),
        ChangeNotifierProvider<CasesProvider>(create: (_)=>CasesProvider()),
        ChangeNotifierProvider<UserDataProvider>(create: (_)=>UserDataProvider()),
      ],
      child: MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: APP_WHITE_COLOR
        ),
        routes: routes,
        initialRoute: HOME_PAGE,
      ),
    );
  }
}


