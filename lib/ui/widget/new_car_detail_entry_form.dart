import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class NewCarDetailEntryForm extends StatefulWidget {

  final FormData _formData;
  final EnquiryProvider _enquiryData;

  NewCarDetailEntryForm(this._formData,this._enquiryData);

  @override
  _NewCarDetailEntryFormState createState() => _NewCarDetailEntryFormState();
}

class _NewCarDetailEntryFormState extends State<NewCarDetailEntryForm>{

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
          children: [
       Container(
      padding: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      decoration: AppBorderStyle.appFormBorder(),
      child: DropdownButton(
          underline: Container(),
          hint: Text(CAR_MAKE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
          icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
          items: widget._formData.carMake.map((e){
            return DropdownMenuItem(child: Text(e), value: e,onTap: ()=>widget._formData.selectedCarMake=e,);
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
                  hint: Text(CAR_MODEL, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.carModel.map((e){
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
                  hint: Text(VARIANT, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.carVariant.map((e){
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
                  hint: Text(COLOUR, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.carColor.map((e){
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
    SizedBox(height: LINE_HEIGHT,),
    RaisedButton(onPressed: (){}, child: Text(CHECK_AVAILABILITY), shape: AppBorderStyle.appButtonShape(), color: APP_OFF_WHITE,),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(LIKELY_TO_PURCHASE_WITHIN, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.likelyToPurchaseWithin.map((e){
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            Row(
              children: [
                Text(FOLLOW_UP, style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
              ],
            ),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(FOLLOW_UP_DATE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.followUpDate.map((e){
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
                  hint: Text(FOLLOW_UP_TIME, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.followUpTime.map((e){
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
                  hint: Text(SCHEDULE_CALL_ON, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.scheduleCallOn.map((e){
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
                  hint: Text(ASSIGN_TO_BRANCH, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.assignToBranch.map((e){
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
              ),
            ),
            SizedBox(height: LINE_HEIGHT,),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value)=>enabledTestDrive(value), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, ),
                Text(SCHEDULE_FOR_TEST_DRIVE, style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),),
              ],
            ),
            SizedBox(height: LINE_HEIGHT,),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              decoration: AppBorderStyle.appFormBorder(),
              child: DropdownButton(
                  underline: Container(),
                  hint: Text(TEST_DRIVE_DATE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.testDriveDate.map((e){
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

                  hint: Text(TEST_DRIVE_TIME, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                  icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                  items: widget._formData.testDriveTime.map((e){
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(),
                  onChanged: onCarMakeTypeChanged
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

  enabledTestDrive(bool value) {}

}

void onCarMakeTypeChanged(value) {

}
