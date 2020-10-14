import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

import 'new_car_detail_entry_form.dart';

class BookingDetailEntryForm extends StatefulWidget {

  final FormData _formData;
  final EnquiryProvider _enquiryData;

  BookingDetailEntryForm(this._formData,this._enquiryData);

  @override
  _BookingDetailEntryFormState createState() => _BookingDetailEntryFormState();
}

class _BookingDetailEntryFormState extends State<BookingDetailEntryForm> {

  TextEditingController _amountController;
  _BookingDetailEntryFormState() {
    _amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(PRICE, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                SizedBox(width: BUTTON_WIDTH),
                ButtonTheme(minWidth: MediaQuery.of(context).size.width-200, child: RaisedButton(elevation: 2, onPressed: (){}, color: PRIMARY_COLOR, child: Text(GET_PRICE, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)), shape: AppBorderStyle.appButtonShape(),))
              ],
            ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(SALES_EXECUTIVE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.salesExecutive.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCarMakeTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(PAYMENT_TYPE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.paymentType.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCarMakeTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: _amountController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: AMOUNT,

              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          ButtonTheme(minWidth: MediaQuery.of(context).size.width-128,
            child: RaisedButton(onPressed: (){}, color: PRIMARY_COLOR, shape: AppBorderStyle.appButtonShape(),
            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            Text(FINISH, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR),),
            SizedBox(width: TEXT_WIDTH,),
            Icon(Icons.done, size: ARROW_RIGHT, color: APP_WHITE_COLOR,)
        ],
        )
    )
    ),
          SizedBox(height: LINE_HEIGHT*1/2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.trash_o, color: APP_RED_COLOR, size: ICON_SIZE,),
              Text(DELETE_CASE, style: AppFontStyle.bodyTextStyle(APP_RED_COLOR),),

            ],
          ),

    ]
    )
    );
  }

  enabledTestDrive(bool value) {}


  }

