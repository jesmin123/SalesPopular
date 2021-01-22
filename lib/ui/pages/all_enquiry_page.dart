
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

class AllEnquiryPage extends StatefulWidget {
  @override
  _AllEnquiryPageState createState() => _AllEnquiryPageState();
}

class _AllEnquiryPageState extends State<AllEnquiryPage> {
  TextEditingController _dateFrom = TextEditingController();
  TextEditingController _dateTo = TextEditingController();

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
                              flex: 1,
                              child: TextFormField(
                                controller: _dateFrom,
                                decoration:InputDecoration(
                                    labelText: "Date From",
                                    labelStyle: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)
                                ),
                              ),
                            ),
                            SizedBox(width:  LINE_HEIGHT,),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                controller: _dateTo,
                                decoration:InputDecoration(
                                    labelText: "Date To",
                                    labelStyle: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)
                                ),
                              ),
                            ),
                            SizedBox(width: LINE_HEIGHT),
                            Container(alignment: Alignment.bottomCenter,
                                child:RaisedButton(
                                  color: Colors.white,
                                  onPressed: (){
                                    try {
                                      enquiryProvider.getSalesWithDateEnquiryDetails(_dateFrom.text, _dateTo.text);
                                    }catch(e){
                                      debugPrint(e);
                                    }
                                  },
                                  child:  Icon(Icons.search,color: Colors.blueAccent,),
                                )),

                          ],
                        ),
                      ),
                    ),
              ListView.separated(
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
