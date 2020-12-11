
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
    final CasesProvider casesProvider = Provider.of(context);
    return Scaffold(
      appBar: MAppBar(ALL_ENQUIRY_TITLE),
        backgroundColor: APP_WHITE_COLOR,
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (BuildContext context,int index){
            return Divider();
          },
          shrinkWrap: true,
            itemCount: casesProvider.cases.length,
            itemBuilder: (BuildContext context,int index)
            {
              return CasesItemWidget(casesProvider.cases[index]);
            }
        ),

      )

    );
  }
}
