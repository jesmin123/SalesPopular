
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/model/CustomerDetails.dart';
import 'package:sales_popular/provider/cases_provider.dart';
import 'package:sales_popular/provider/current_provider.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/utils/loaderUtilis.dart';

class CustomerDetailEntryForm extends StatefulWidget {



  CustomerDetailEntryForm();

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
     // _nameController = TextEditingController();
     // _emailController = TextEditingController();
     // _dobController = TextEditingController();
     // _mobNoController = TextEditingController();
     // _sccMobNoController = TextEditingController();
     // _addressLine1Controller = TextEditingController();
     // _addressLine2Controller = TextEditingController();
     // _addressAreaController =TextEditingController();

  }

  final _formKey = GlobalKey<FormState>();


  final mobileValidator = MultiValidator([
    RequiredValidator(errorText: 'Mobile No. is required'),
    MinLengthValidator(10, errorText: 'Enter up to 10 digits'),
  ]);

  final singleValidator = MultiValidator([
    RequiredValidator(errorText: 'this field is required'),
  ]);

  void initState(){
     // initData();
    super.initState();
  }
  void initData(){
    final EnquiryProvider enquiryProvider=Provider.of(context,listen: false);
    _nameController = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.customerName:"");
    _emailController = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.email:"");
    _dobController = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.dob:"");
    _mobNoController = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.mobileNo:'');
    _sccMobNoController = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.secondaryMobileNo:'');
    _addressLine1Controller = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.addressLine1:"");
    _addressLine2Controller = TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.addressLine2:"");
    _addressAreaController =TextEditingController(text: enquiryProvider.selectedCaseModel!=null?enquiryProvider.selectedCaseModel.customerDetails.addressArea:"");
  }

  @override
  Widget build(BuildContext context) {


    final FormData formData = Provider.of(context);
    final CasesProvider casesProvider = Provider.of(context);
    final CurrentProvider currentProvider = Provider.of(context);
    final EnquiryProvider enquiryData = Provider.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField(
              validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
              hint: Text(SELECT_CUSTOMER_TYPE+ '*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
              icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
              items: formData.customerType.map((e){
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
              items: formData.salutations.map((e){
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
          RaisedButton(onPressed: (){validateCustomer(_mobNoController.text,enquiryData);}, color: APP_OFF_WHITE, child: Text(EXISTING_CUSTOMER), shape: AppBorderStyle.appButtonShape() ),
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
              items: formData.villages.map((e){
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

              items: formData.taluks.map((e){
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

              items: formData.districts.map((e){
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
              items: formData.states.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: (value){formData.selectedState = value;}
          ),
          SizedBox(height: LINE_HEIGHT,),
          ButtonTheme(minWidth: MediaQuery.of(context).size.width-128, child: RaisedButton(elevation: 2,
            onPressed: (){if (_formKey.currentState.validate())
            {
              CustomerDetails customer = new CustomerDetails(customerName: _nameController.text,customerType: formData.selectedCustomerType,
              salutation: formData.selectedSalutations, dob: _dobController.text, email:  _emailController.text, mobileNo: _mobNoController.text,
                secondaryMobileNo: _sccMobNoController.text, addressLine1: _addressLine1Controller.text, addressLine2:  _addressLine2Controller.text,
                addressArea: _addressAreaController.text, village: formData.selectedVillages, taluk: formData.selectedTaluk, district: formData.selectedDistrict,
                state: formData.selectedState
              );
            Future.delayed(Duration(seconds: 3)).then((value) {
                Loader.getLoader(context).hide().whenComplete(() {
                  formData.activeStep = 1;
                  formData.stepCount = 1;
                  currentProvider.caseModel.customerDetails = customer;
                });
              });


          }}, color: PRIMARY_COLOR, child: Text(SAVE, style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR)), shape: AppBorderStyle.appButtonShape(),))
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
