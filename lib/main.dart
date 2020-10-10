import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/pages/new_enquiry_page.dart';
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
    NEW_ENQUIRY_PAGE: (context)=>ChangeNotifierProvider(create:(context)=>FormData(),child: NewEnquiryPage()),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: APP_WHITE_COLOR
      ),
      routes: routes,
      initialRoute: NEW_ENQUIRY_PAGE,
    );
  }
}


