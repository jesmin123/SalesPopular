import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class OldCarDetailEntryForm extends StatefulWidget {

  final FormData _formData;
  final EnquiryProvider _enquiryData;

  OldCarDetailEntryForm(this._formData,this._enquiryData);

  @override
  _OldCarDetailEntryFormState createState() => _OldCarDetailEntryFormState();
}

class _OldCarDetailEntryFormState extends State<OldCarDetailEntryForm> {

  TextEditingController _remarksController;
  _OldCarDetailEntryFormState() {
    _remarksController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(CAR_MAKE,
                    style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.carMake.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(CAR_MODEL,
                    style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.carModel.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(VARIANT,
                    style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.variant.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(
                    COLOUR, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.color.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
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
                  hint: Text(EVALUATOR_BRANCH, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.evaluatorBranch.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
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
                  hint: Text(EVALUATOR_NAME, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.evaluatorName.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            TextFormField(
              controller: _remarksController,
              autofocus: false,
              decoration: InputDecoration(
                labelText: REMARKS,
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
                    Text(SAVE, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR),),
                    SizedBox(width: TEXT_WIDTH,),
                    Icon(Icons.arrow_forward_ios_outlined, size: ARROW_RIGHT, color: APP_WHITE_COLOR,)
                  ],
                ),),
            )
          ],
        )
    );
  }

  void onCarMakeTypeChanged(value) {

  }
}
