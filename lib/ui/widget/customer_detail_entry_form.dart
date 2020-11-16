
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
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

  final _formKey = GlobalKey<FormState>();


  final mobileValidator = MultiValidator([
    RequiredValidator(errorText: 'Mobile No. is required'),
    MinLengthValidator(10, errorText: 'Enter up to 10 digits'),
  ]);

  final singleValidator = MultiValidator([
    RequiredValidator(errorText: 'this field is required'),
  ]);


  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);



    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(SELECT_CUSTOMER_TYPE+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.customerType.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (e){formData.selectedCustomerType=e;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(SELECT_SALUTATIONS+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.salutations.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (e){formData.selectedSalutations=e;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            validator: singleValidator,
            controller: _nameController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: CUSTOMER_NAME+ '*',
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            validator: singleValidator,
            controller: _dobController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: DATE_OF_BIRTH+ '*',
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
            onTap: () async{
            DateTime date = DateTime(1900);
            FocusScope.of(context).requestFocus(new FocusNode());
            DateTime dt = await showMDatePicker();
           _dobController.text = dt.toIso8601String().substring(0,10);
          },),
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
            validator: mobileValidator,
            keyboardType: TextInputType.phone,
            controller:  _mobNoController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: MOBILE_NUMBER+ '*',
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
            validator: singleValidator,
            controller: _addressLine1Controller,
            autofocus: false,
            decoration: InputDecoration(
              labelText: ADDRESS_LINE_1+ '*',
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
            validator: singleValidator,
            controller: _addressAreaController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: ADDRESS_AREA+ '*',
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(VILLAGE+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.villages.map((e){
                return DropdownMenuItem(child: Text(e['village']),value: e['village'],);
              }).toList(),
              onChanged: (village){formData.selectedVillages=village;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(TALUK+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),

              items: widget._formData.taluks.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (value){formData.selectedTaluk= value;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(DISTRICT+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),

              items: widget._formData.districts.map((e){
                return DropdownMenuItem(child: Text(e['district']),value: e['district'],);
              }).toList(),
              onChanged: (value){formData.selectedDistrict= value;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(STATE+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR)),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: widget._formData.states.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (value){formData.selectedState = value;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          ButtonTheme(minWidth: MediaQuery.of(context).size.width-128, child: RaisedButton(elevation: 2, onPressed: (){if (_formKey.currentState.validate()){formData.activeStep=1;formData.stepCount=1;}}, color: PRIMARY_COLOR, child: Text(SAVE, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)), shape: AppBorderStyle.appButtonShape(),))
        ],
      ),


    );
  }

  void onCustomerTypeChanged(value) {

  }

  void validateCustomer(String mobNo,EnquiryProvider enquiryProvider) {
    enquiryProvider.checkforExistingCustomer(mobNo);
  }

  Future<DateTime> showMDatePicker() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate:DateTime.now(),
        firstDate:DateTime(1900),
        lastDate: DateTime(2100));

    return date!=null?date:DateTime.now();
  }
}
