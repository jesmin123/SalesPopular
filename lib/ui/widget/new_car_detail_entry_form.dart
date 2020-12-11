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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class NewCarDetailEntryForm extends StatefulWidget {
  final FormData _formData;
  final EnquiryProvider _enquiryData;

  NewCarDetailEntryForm(this._formData, this._enquiryData);

  @override
  _NewCarDetailEntryFormState createState() => _NewCarDetailEntryFormState();
}

class _NewCarDetailEntryFormState extends State<NewCarDetailEntryForm> {

  TextEditingController _followUpDateController =TextEditingController();
  TextEditingController _followUpTimeController = TextEditingController();
  TextEditingController _scheduleCallOnController = TextEditingController();
  TextEditingController _testDriveDateController = TextEditingController();
  TextEditingController _testDriveTimeController = TextEditingController();
  _NewCarDetailEntryFormState(){
    _followUpDateController = TextEditingController();
    _followUpTimeController = TextEditingController();
    _scheduleCallOnController = TextEditingController();
    _testDriveDateController = TextEditingController();
    _testDriveTimeController = TextEditingController();
}
  ProgressDialog pr;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  final singleValidator = MultiValidator([
    RequiredValidator(errorText: 'this field is required'),
  ]);



  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    final EnquiryProvider enquiryProvider = Provider.of(context);
    final CurrentProvider currentProvider = Provider.of(context);

    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 4.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Exo"),
        messageTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 19.0,
            fontWeight: FontWeight.w400,
            fontFamily: "Exo"));


    return Form(
      key: _formKey,
        child: Column(
      children: [
        DropdownButtonFormField(
            validator: (value) => value == null ? 'this field is required' : null,
            decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
            hint: Text(
              CAR_MAKE,
              style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: PRIMARY_COLOR,
            ),
            items: widget._formData.carMake.map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
            onChanged: (e) {
              formData.selectedCarMake = e;
            }),
        SizedBox(
          height: LINE_HEIGHT,
        ),
        DropdownButtonFormField(
            validator: (value) => value == null ? 'this field is required' : null,
            decoration:
            InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
            hint: Text(
              CAR_MODEL,
              style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: PRIMARY_COLOR,
            ),
            items: widget._formData.carModel.map((e) {
              return DropdownMenuItem(child: Text(e), value: e);
            }).toList(),
            onChanged: (e) {formData.selectedModel=e;}),
        SizedBox(
          height: LINE_HEIGHT,
        ),
        DropdownButtonFormField(

            validator: (value) => value == null ? 'this field is required' : null,
            decoration:
                InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
            hint: Text(
              VARIANT,
              style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: PRIMARY_COLOR,
            ),
            items: widget._formData.carVariant.map((e) {
              String variant = e['carVariant'];
              return DropdownMenuItem(child: Text(variant,overflow: TextOverflow.fade,), value: variant);
            }).toList(),
            onChanged: (variant){formData.selectedVariant=variant;}
        ),
        SizedBox(
          height: LINE_HEIGHT,
        ),
        DropdownButtonFormField(
            validator: (value) => value == null ? 'this field is required' : null,
            decoration:
            InputDecoration(enabledBorder: AppBorderStyle.getFormBorder(),),
            hint: Text(
                     COLOUR,
                     overflow: TextOverflow.fade,
                     style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
         ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: PRIMARY_COLOR,
            ),
            items: widget._formData.carColor.map((e) {
              String val = e;
              if(val.length>20){
                val = val.substring(0,20);
              }
              return DropdownMenuItem(
                child: Text(val,overflow: TextOverflow.fade,), value: e,
              );
            }).toList(),
            onChanged: (e){formData.selectedCarColor= e;}

        ),
        SizedBox(
          height: LINE_HEIGHT,
        ),
        RaisedButton(
          onPressed: () async {
            if (_formKey.currentState.validate()){
              bool isAvailable = await enquiryProvider.CheckAvailability(formData.selectedCarMake, formData.selectedModel, formData.selectedVariant, formData.selectedCarColor, 'SLM_KTM');
              if(isAvailable){
                pr.show();
                Future.delayed(Duration(seconds: 3)).then((value) {
                  pr.hide().whenComplete(() {
                    Fluttertoast.showToast(
                      msg: "Product is Available",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: PRIMARY_COLOR,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                });

              }
              else {
                pr.show();
                Future.delayed(Duration(seconds: 3)).then((value) {
                  pr.hide().whenComplete(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            title: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text("Warning", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),
                                ),
                                SizedBox(height: LINE_HEIGHT * 0.5),
                                Text(
                                  "Looking for the product is not available. Do you want to continue",
                                  style: AppFontStyle.labelTextStyle(
                                      APP_BLACK_COLOR),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                SizedBox(height: LINE_HEIGHT * 0.2),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, HOME_PAGE);
                                      },
                                      child: Text(
                                        "No",
                                        style:
                                        AppFontStyle.labelTextStyle(
                                            PRIMARY_COLOR),
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes",
                                            style: AppFontStyle
                                                .labelTextStyle(
                                                PRIMARY_COLOR)))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  });
                });

              }
          }},
          child: Text(CHECK_AVAILABILITY),
          shape: AppBorderStyle.appButtonShape(),
          color: APP_OFF_WHITE,
        ),
        SizedBox(
          height: LINE_HEIGHT,
        ),
        Form(
          key: _key,
          child: Column(
            children: [
              DropdownButtonFormField(
                  validator: (value) => value == null ? 'this field is required' : null,
              decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                  hint: Text(
                    LIKELY_TO_PURCHASE_WITHIN,
                    style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: PRIMARY_COLOR,
                  ),
                  items: widget._formData.likelyToPurchaseWithin.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (e) {
                    formData.selectedLikelyToPurchaseWithin = e;
                  }),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              Row(
                children: [
                  Text(
                    FOLLOW_UP,
                    style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),
                  ),
                ],
              ),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              TextFormField(
                validator: singleValidator,
                controller: _followUpDateController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: FOLLOW_UP_DATE+ '*',
                  labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  enabledBorder: AppBorderStyle.getFormBorder(),
                  focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                ),
                onTap: () async{
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime dt = await showMDatePicker();
                  _followUpDateController.text = dt.toIso8601String().substring(0,10);
                },),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              TextFormField(
                validator: singleValidator,
                controller: _followUpTimeController,
                onTap: () async {
                  TimeOfDay selectedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  _followUpTimeController.text = selectedTime.format(context);
                },
                autofocus: false,
                decoration: InputDecoration(
                  labelText: FOLLOW_UP_TIME+ '*',
                  labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  enabledBorder: AppBorderStyle.getFormBorder(),
                  focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                ),
              ),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              TextFormField(
                validator: singleValidator,
                controller: _scheduleCallOnController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: SCHEDULE_CALL_ON+ '*',
                  labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  enabledBorder: AppBorderStyle.getFormBorder(),
                  focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                ),
                onTap: () async{
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime dt = await showMDatePicker();
                  _scheduleCallOnController.text = dt.toIso8601String().substring(0,10);
                },),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              DropdownButtonFormField(
                  validator: (value) => value == null ? 'this field is required' : null,
                  decoration: InputDecoration(enabledBorder: AppBorderStyle.getFormBorder()),
                  hint: Text(
                    ASSIGN_TO_BRANCH,
                    style: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: PRIMARY_COLOR,
                  ),
                  items: widget._formData.assignToBranch.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value){formData.selectedBranch = value;}
              ),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              Row(
                children: [
                  Checkbox(
                    value: formData.isTestDrive,
                    onChanged: (value) => formData.isTestDrive = value,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(
                    SCHEDULE_FOR_TEST_DRIVE,
                    style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),
                  ),
                ],
              ),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              TextFormField(
                validator: singleValidator,
                controller: _testDriveDateController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: TEST_DRIVE_DATE+ '*',
                  labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  enabledBorder: AppBorderStyle.getFormBorder(),
                  focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                ),
                onTap: () async{
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime dt = await showMDatePicker();
                  _testDriveDateController.text = dt.toIso8601String().substring(0,10);
                },),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              TextFormField(
                validator: singleValidator,
                controller: _testDriveTimeController,
                onTap: () async {
                  TimeOfDay selectedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  _testDriveTimeController.text = selectedTime.format(context);
                },
                autofocus: false,
                decoration: InputDecoration(
                  labelText: TEST_DRIVE_TIME+ '*',
                  labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
                  enabledBorder: AppBorderStyle.getFormBorder(),
                  focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                ),
              ),
              SizedBox(
                height: LINE_HEIGHT,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 128,
                child: RaisedButton(
                  onPressed: () {
                    if (_key.currentState.validate()){
                      NewCarDetails newCarDetails = new NewCarDetails(
                        carMake: formData.selectedCarMake, carModel: formData.selectedModel, variant: formData.selectedVariant,
                        color: formData.selectedCarColor, likelyToPurchaseWithin: formData.selectedLikelyToPurchaseWithin,
                        followUpDate: _followUpDateController.text, followUpTime: _followUpTimeController.text,
                        scheduleCallOn: _scheduleCallOnController.text, assignToBranch: formData.selectedBranch,
                        testDriveDate: _testDriveDateController.text, testDriveTime: _testDriveTimeController.text
                      );

                      formData.activeStep=2;formData.stepCount=2;
                      currentProvider.caseModel.newCarDetails = newCarDetails;

                    }
                  },
                  color: PRIMARY_COLOR,
                  shape: AppBorderStyle.appButtonShape(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        SAVE,
                        style: AppFontStyle.buttonTextStyle(APP_WHITE_COLOR),
                      ),
                      SizedBox(
                        width: TEXT_WIDTH,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: ARROW_RIGHT,
                        color: APP_WHITE_COLOR,
                      )
                    ],
                  ),
                ),
              )
                ],
          ),
        ),

      ],
    ));
  }

  enabledTestDrive(bool value) {}


    Future<DateTime> showMDatePicker() async {
    DateTime date = await showDatePicker(
    context: context,
    initialDate:DateTime.now(),
    firstDate:DateTime(1900),
    lastDate: DateTime(2100));

    return date!=null?date:DateTime.now();
    }
}

void onCarMakeTypeChanged(value) {}
