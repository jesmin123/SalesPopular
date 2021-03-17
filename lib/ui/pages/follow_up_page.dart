import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/model/CaseModel.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/follow_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/follow_up_widget.dart';

class FollowUpPage extends StatefulWidget {

  FollowUpPage();

  @override
  _FollowUpPageState createState() => _FollowUpPageState();
}

class _FollowUpPageState extends State<FollowUpPage> {

  DatePickerController _controller = DatePickerController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final FollowProvider followProvider = Provider.of(context);
    final EnquiryProvider enquiryProvider = Provider.of(context);
    final FormData formData = Provider.of(context);

    return Scaffold(
      appBar: MAppBar(FOLLOW_UP),
      backgroundColor: APP_WHITE_COLOR,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: DatePicker(
                  DateTime(2020,12),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime(2020,12),
                  selectionColor: PRIMARY_COLOR,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    followProvider.selectedValue = date;
                    followProvider.cases = enquiryProvider.getCasesByDate(date.toIso8601String().substring(0,10));
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: followProvider.cases.length,
                  itemBuilder: (BuildContext context,int index){
                    return FollowUpWidget(enquiryProvider.casesList[index]) ;
                  }
                  )
            ],
          ),
        ),
      ),
    );
  }

  void initData() {
    EnquiryProvider enquiryProvider = Provider.of(context,listen: false);
    FollowProvider followProvider = Provider.of(context,listen: false);
    followProvider.cases = enquiryProvider.getCasesByDate(DateTime.now().toIso8601String().substring(0,10));
  }

}
