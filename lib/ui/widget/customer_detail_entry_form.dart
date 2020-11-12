
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class CustomerDetailEntryForm extends StatefulWidget {

  final FormData _formData;
  final EnquiryProvider _enquiryData;

  CustomerDetailEntryForm(this._formData,this._enquiryData);

  @override
  _CustomerDetailEntryFormState createState() => _CustomerDetailEntryFormState();
}

class _CustomerDetailEntryFormState extends State<CustomerDetailEntryForm> {

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _dobController;
  TextEditingController _mobNoController;
  TextEditingController _sccMobNoController;
  TextEditingController _addressLine1Controller;
  TextEditingController _addressLine2Controller;
  TextEditingController _addressAreaController;



  _CustomerDetailEntryFormState(){
     _nameController = TextEditingController();
     _emailController = TextEditingController();
     _dobController = TextEditingController();
     _mobNoController = TextEditingController();
     _sccMobNoController = TextEditingController();
     _addressLine1Controller = TextEditingController();
     _addressLine2Controller = TextEditingController();
     _addressAreaController =TextEditingController();
  }

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
                hint: Text(SELECT_CUSTOMER_TYPE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.customerType.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(SELECT_SALUTATIONS, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.salutations.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _nameController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: CUSTOMER_NAME,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _dobController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: DATE_OF_BIRTH,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller:  _emailController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: EMAIL,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller:  _mobNoController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: MOBILE_NUMBER,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: _sccMobNoController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: SECONDARY_MOBILE_NUMBER,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          RaisedButton(onPressed: (){validateCustomer(_mobNoController.text,widget._enquiryData);}, color: APP_OFF_WHITE, child: Text(EXISTING_CUSTOMER), shape: AppBorderStyle.appButtonShape() ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _addressLine1Controller,
            autofocus: false,
            decoration: InputDecoration(
              labelText: ADDRESS_LINE_1,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _addressLine2Controller,
            autofocus: false,
            decoration: InputDecoration(
              labelText: ADDRESS_LINE_2,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _addressAreaController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: ADDRESS_AREA,
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(VILLAGE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),

                items: widget._formData.villages.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(TALUK, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),

                items: widget._formData.taluks.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(DISTRICT, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),

                items: widget._formData.districts.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text(STATE, style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.states.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,onTap: ()=>widget._formData.selectedStates=e,);
                }).toList(),



                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          ButtonTheme(minWidth: MediaQuery.of(context).size.width-128, child: RaisedButton(elevation: 2, onPressed: (){}, color: PRIMARY_COLOR, child: Text(SAVE, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)), shape: AppBorderStyle.appButtonShape(),))
        ],
      ),


    );
  }

  void onCustomerTypeChanged(value) {

  }

  void validateCustomer(String mobNo,EnquiryProvider enquiryProvider) {
    enquiryProvider.checkforExistingCustomer(mobNo);
  }
}
