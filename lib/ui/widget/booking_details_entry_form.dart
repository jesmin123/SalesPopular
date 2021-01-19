import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/model/CustomerDetails.dart';
import 'package:sales_popular/provider/current_provider.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:sales_popular/utils/loaderUtilis.dart';

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

  final _formKey = GlobalKey<FormState>();
  final singleValidator = MultiValidator([
    RequiredValidator(errorText: 'this field is required'),
  ]);



  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    final CurrentProvider currentProvider = Provider.of(context);
    final UserDataProvider userProvider = Provider.of(context);
    return Form(
      key: _formKey,
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
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(SALES_EXECUTIVE+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.salesExecutive.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (val){formData.selectedSalesExecutive = val;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(PAYMENT_TYPE+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.paymentType.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (val){formData.selectedPaymentType = val;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text('Source of Enquiry'+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.source.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (val){formData.selectedSource = val;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            validator: singleValidator,
            keyboardType: TextInputType.phone,
            controller: _amountController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: AMOUNT+'*',

              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          ButtonTheme(

              minWidth: MediaQuery.of(context).size.width-128,
            child: RaisedButton(onPressed: () async {if (_formKey.currentState.validate()){
              BookingDetails bookingDetails = new BookingDetails(
                salesexecutive: formData.selectedSalesExecutive, paymentType: formData.selectedPaymentType, amount: _amountController.text
              );
              formData.activeStep=4;
              currentProvider.caseModel.bookingDetails = bookingDetails;
              String dataBase64 = currentProvider.caseModel.getFinalData();
              bool status = await currentProvider.saveTransaction(userProvider.UserID, userProvider.SessionID, dataBase64);
              Loader.getLoader(context).hide();
              if(status){
                showSucessDialog();
              }else{
                Fluttertoast.showToast(
                  msg: 'Something wrong',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: PRIMARY_COLOR,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );

              }
              }},
                color: PRIMARY_COLOR, shape: AppBorderStyle.appButtonShape(),
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

  showSucessDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Success", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                  SizedBox(height: LINE_HEIGHT*0.5,),
                  Text("You have punched the enquiry successfully", style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR), textAlign: TextAlign.center,),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, HOME_PAGE);
                          },
                          child: Text("OK", style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),)
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      ).then((value){
        Navigator.pushNamed(context, HOME_PAGE);
      });
    }
  }

