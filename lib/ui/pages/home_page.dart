import 'package:flutter/material.dart';
import 'package:sales_popular/constants/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              GestureDetector(onTap: ()=>showNewCaseWindow(context),child: Text('Click here to add new case'))
            ],
          )
      ),
    );
  }

  showNewCaseWindow(BuildContext context) {
    Navigator.pushReplacementNamed(context, NEW_ENQUIRY_PAGE);
  }

}
