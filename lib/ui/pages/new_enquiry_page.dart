
import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/booking_details_entry_form.dart';
import 'package:sales_popular/ui/widget/customer_detail_entry_form.dart';
import 'package:sales_popular/ui/widget/new_car_detail_entry_form.dart';
import 'package:sales_popular/ui/widget/old_car_details_entry_form.dart';


class NewEnquiryPage extends StatefulWidget {
  @override
  _NewEnquiryPageState createState() => _NewEnquiryPageState();
}

class _NewEnquiryPageState extends State<NewEnquiryPage> {



  @override
  Widget build(BuildContext context) {
    final FormData formData = Provider.of(context);
    final EnquiryProvider enquiryProvider = Provider.of(context);

    return Scaffold(
      appBar: MAppBar(NEW_ENQUIRY_PAGE_TITLE),
      backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FAStepper(
              type: FAStepperType.horizontal,
              titleHeight: 120,
              currentStep: formData.stepCount,
              onStepTapped: (val)=>changeStep(val, formData),
              titleIconArrange: FAStepperTitleIconArrange.row,
              steps:[
                  FAStep(state: formData.activeStep>0?FAStepstate.complete:FAStepstate.editing, title: Text(CUSTOMER_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),textAlign: TextAlign.center,), content: CustomerDetailEntryForm(formData,enquiryProvider),isActive: formData.stepCount==0),
                  FAStep(state: formData.activeStep>1?FAStepstate.complete:FAStepstate.editing, title: Text(NEW_CAR_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: NewCarDetailEntryForm(formData,enquiryProvider),isActive: formData.stepCount==1 ),
                  FAStep(state: formData.activeStep>2?FAStepstate.complete:FAStepstate.editing, title: Text(OLD_CAR_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: OldCarDetailEntryForm(formData,enquiryProvider), isActive: formData.stepCount==2,),
                  FAStep(state: formData.activeStep>3?FAStepstate.complete:FAStepstate.editing, title: Text(BOOKING_DETAIL,style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),), content: BookingDetailEntryForm(formData,enquiryProvider), isActive: formData.stepCount==3,)
              ],
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                Container(),
          ),
        )
      ),
    );
  }

  void changeStep(int value, FormData formData) {
    formData.stepCount = value;
  }
}

