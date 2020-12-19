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
import 'package:sales_popular/provider/current_provider.dart';
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

  TextEditingController _remarksController= new TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    final CurrentProvider currentProvider = Provider.of(context);
    return Form(
      key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(onPressed:(){formData.stepCount = 3;},
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: PRIMARY_COLOR,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Skip ', style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR, textSize: 14.0)),
                          Icon(Icons.skip_next, color: APP_WHITE_COLOR, size: ICON_SIZE*1.5,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(CAR_MAKE+'*',
                  style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.exchangeCarMakes.map((e) {
                  return DropdownMenuItem(child: Text(e), value: e,);
                }).toList(),
                onChanged: (value){formData.selectedExchangeCarMakes = value;}
            ),
            SizedBox(height: LINE_HEIGHT,),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(CAR_MODEL+'*',
                  style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.exchangeCarModels.map((e) {
                  return DropdownMenuItem(child: Text(e['otherCarModel']), value: e['otherCarModel'],);
                }).toList(),
                onChanged: (value){formData.selectedExchaneCarModels = value;}
            ),
            SizedBox(height: LINE_HEIGHT,),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(VARIANT+'*',
                  style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.exchangeCarVariants.map((e) {
                  return DropdownMenuItem(child: Text(e['otherCarVariant']), value: e['otherCarVariant'],);
                }).toList(),
                onChanged: (value){formData.selectedExchangeCarVariants = value;}
            ),
            SizedBox(height: LINE_HEIGHT,),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(
                  COLOUR+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.exchangeCarColours.map((e) {
                  String val = e['otherCarColour'];
                  if(val.length>20){
                    val = val.substring(0,20);
                  }
                  return DropdownMenuItem(child: Text(val), value: val);
                }).toList(),
                onChanged: (val){formData.selectedExchangeCarColours = val;}
            ),
            SizedBox(height: LINE_HEIGHT,),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(EVALUATOR_BRANCH+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.assignToBranch.map((e) {
                  return DropdownMenuItem(child: Text(e), value: e,);
                }).toList(),
                onChanged: (value){formData.selectedExchangeBranch = value;}
            ),
            SizedBox(height: LINE_HEIGHT,),
            DropdownButtonFormField(
                validator: (value) => value == null ? 'this field is required' : null,
                decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                hint: Text(EVALUATOR_NAME+'*', style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),),
                icon: Icon(Icons.keyboard_arrow_down, color: PRIMARY_COLOR,),
                items: widget._formData.exchangeCarEvaluators.map((e) {
                  String val = e;
                  if(val.length > 20){
                    val =val.substring(0,20);
                  }
                  return DropdownMenuItem(child: Text(val), value: e,);
                }).toList(),
                onChanged: (value){formData.selectedExchangeCarEvaluators = value;}
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
              child: RaisedButton(onPressed: (){
                if (_formKey.currentState.validate()){
                  OldCarDetails oldCarDetails = new OldCarDetails(
                    exchangeCarMake: formData.selectedExchangeCarMakes, exchangeCarModel: formData.selectedExchaneCarModels,
                    exchangeCarVariant: formData.selectedExchangeCarVariants, exchangeCarColor: formData.selectedExchangeCarColours,
                    evalutorName: formData.selectedExchangeCarEvaluators, evalutorBranch: formData.selectedExchangeBranch,
                    remarks: _remarksController.text
                  );

                  formData.activeStep = 3 ;
                  formData.stepCount = 3;
                  currentProvider.caseModel.oldCarDetails = oldCarDetails;
                }
              }, color: PRIMARY_COLOR, shape: AppBorderStyle.appButtonShape(),
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
