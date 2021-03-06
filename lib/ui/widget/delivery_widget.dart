import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/model/CaseModel.dart';

class DeliveryWidget extends StatefulWidget {

  final CaseModel caseModel;

  DeliveryWidget(this.caseModel);

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text("${widget.caseModel.customerDetails.customerName}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)),
        subtitle: Text("${widget.caseModel.customerDetails.mobileNo}", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR),),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: EdgeInsets.only(left: PADDING_WIDTH_2),
        children: [
          Text("Car Details", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
          Padding(
            padding: const EdgeInsets.only(left: PADDING_WIDTH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.caseModel.newCarDetails.carMake +" "+ widget.caseModel.newCarDetails.carModel}", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
                Text("Booked On : 15 OCT 2020 ", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
              ],
            ),
          ),
          SizedBox(height: LINE_HEIGHT*0.5),
          Text("Payment Details", style: AppFontStyle.regularTextStyle3(APP_BLACK_COLOR),),
          Padding(
            padding: const EdgeInsets.only(left: PADDING_WIDTH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount : "+ "${widget.caseModel.bookingDetails.amount}", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
                Text("Transaction ID : #A456132", style: AppFontStyle.bodyTextStyle(APP_GREY_COLOR)),
                SizedBox(height: LINE_HEIGHT),
                Padding(
                  padding: const EdgeInsets.only(left: PADDING_WIDTH_2*6),
                  child: RaisedButton(onPressed: ()=>_onDeliveryMarked(), color: PRIMARY_COLOR, child: Text(MARK_DELIVERED, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)), shape: AppBorderStyle.appButtonShape()),
                ),
                SizedBox(height: LINE_HEIGHT*0.5),
              ],

            ),
          )
        ],
    );

  }

  _onDeliveryMarked() {
    // TODO Implement logic
  }
}