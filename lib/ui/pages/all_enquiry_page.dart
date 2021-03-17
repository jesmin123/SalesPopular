
import 'package:flutter/cupertino.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/ui/widget/cases_item_widget.dart';
import '../../provider/cases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import  'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class AllEnquiryPage extends StatefulWidget {
  @override
  _AllEnquiryPageState createState() => _AllEnquiryPageState();
}

class _AllEnquiryPageState extends State<AllEnquiryPage> {
  TextEditingController _dateFrom = TextEditingController();
  TextEditingController _dateTo = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  @override
  void initState() {
    super.initState();
    getSupportingData();
  }

  getSupportingData(){

    final CasesProvider casesProvider = Provider.of(context,listen: false);

  }

  @override
  Widget build(BuildContext context) {
    final EnquiryProvider enquiryProvider = Provider.of(context);
    return Scaffold(
      appBar: MAppBar(ALL_ENQUIRY_TITLE),
        backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(
                padding: const EdgeInsets.all(16.0),
                      child: Form(
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: field(_dateFrom, f1,
                                  () async {
                                    f1.unfocus();
                                    List<DateTime> dt =  await DateRangePicker.showDatePicker(
                                        context: context, initialFirstDate: DateTime.now(), initialLastDate: DateTime.now().add(Duration(days: 3)),
                                        firstDate: DateTime(2015), lastDate: DateTime(2030));
                                    dt = dt!=null?dt:[DateTime.now(),DateTime.now().add(Duration(days: 2))];
                                    _dateFrom.text = "${dt.first.toIso8601String().substring(0,10)} - ${dt.last.toIso8601String().substring(0,10)}";
                                    enquiryProvider.date = dt;
                                  }, "Select date range"),
                            ),
                            SizedBox(width: LINE_HEIGHT),
                            Flexible(
                              flex: 1,
                              child: Container(height: 40,
                                  child:RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    color: PRIMARY_COLOR,
                                    onPressed: (){
                                      try {
                                        enquiryProvider.getSalesWithDateEnquiryDetails(enquiryProvider.date.first.toString(), enquiryProvider.date.last.toString());
                                      }catch(e){
                                        debugPrint(e);
                                      }
                                    },
                                    child:  Icon(Icons.search,color: Colors.white,),
                                  )),
                            ),

                          ],
                        ),
                      ),
                    ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context,int index){
                  return Divider();
                },
                shrinkWrap: true,
                  itemCount: enquiryProvider.casesList.length,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return CasesItemWidget(enquiryProvider.casesList[index]);
                  }
              ),


            ],
          ),
        ),


      )

    );
  }
}

Widget field(TextEditingController controller, FocusNode focus, Function function, String text){
  return Container(
    height: 40,
    child: TextFormField(
      controller: controller,
      focusNode: focus,
      onTap: function,
      decoration: InputDecoration(

        fillColor: Colors.grey[200],
        filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
        contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        hintText: text,
        hintStyle: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),
      ),
    ),
  );
}