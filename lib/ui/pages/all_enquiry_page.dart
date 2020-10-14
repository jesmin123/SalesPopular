import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/cases_provider.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      casesProvider.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CasesProvider casesProvider = Provider.of(context);
    return Container(

    );
  }
}
