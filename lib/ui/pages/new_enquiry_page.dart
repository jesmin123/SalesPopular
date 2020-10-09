
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/ui/widget/customer_detail_entry_form.dart';
import 'package:sales_popular/utils/SubAppBar.dart';

class NewEnquiryPage extends StatefulWidget {
  @override
  _NewEnquiryPageState createState() => _NewEnquiryPageState();
}

class _NewEnquiryPageState extends State<NewEnquiryPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(NEW_ENQUIRY_PAGE_TITLE),
      backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: FAStepper(
            type: FAStepperType.horizontal,
            titleHeight: 120,
            steps:[
                FAStep(state: FAStepstate.complete, title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),textAlign: TextAlign.center,), content: CustomerDetailEntryForm(),isActive: true,),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: CustomerDetailEntryForm()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: CustomerDetailEntryForm()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: CustomerDetailEntryForm()),
                FAStep(title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: CustomerDetailEntryForm()),
          ],

        ),
      ),
    );
  }
}

