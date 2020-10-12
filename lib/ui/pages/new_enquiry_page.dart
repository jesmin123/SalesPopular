
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/customer_detail_entry_form.dart';
import 'file:///G:/FlutterApps/sales_popular/lib/ui/widget/SubAppBar.dart';

class NewEnquiryPage extends StatefulWidget {
  @override
  _NewEnquiryPageState createState() => _NewEnquiryPageState();
}

class _NewEnquiryPageState extends State<NewEnquiryPage> {

  @override
  void initState() {
    super.initState();
    getSupportingData();
  }

  getSupportingData(){

    final FormData formData = Provider.of(context,listen: false);
    final EnquiryProvider enquiryProvider = Provider.of(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formData.initDataLoading();
      enquiryProvider.initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    final EnquiryProvider enquiryProvider = Provider.of(context);

    return Scaffold(
      appBar: MAppBar(NEW_ENQUIRY_PAGE_TITLE),
      backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: FAStepper(
            type: FAStepperType.horizontal,
            titleHeight: 120,
            currentStep: enquiryProvider.stepNo,
            titleIconArrange: FAStepperTitleIconArrange.row,
            steps:[
                FAStep(state: FAStepstate.complete, title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),textAlign: TextAlign.center,), content: CustomerDetailEntryForm(formData,enquiryProvider),isActive: true,),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: Container()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: Container()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: Container()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: Container()),
            ],
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        )
      ),
    );
  }

  void changeStep(int value, EnquiryProvider enquiryProvider) {
    enquiryProvider.stepNo = value;
  }
}

