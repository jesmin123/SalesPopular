import 'package:flutter/material.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/delivery_widget.dart';

class DeliveryPage extends StatefulWidget{
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(DELIVERY),
      backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index)
            {
              return DeliveryWidget();
            }
        ),

      )
    );
  }
}
