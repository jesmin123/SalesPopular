import 'package:cached_network_image/cached_network_image.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:sales_popular/ui/widget/cases_item_widget.dart';
import '../../provider/cases_provider.dart';
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

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  @override
  void initState() {
    super.initState();
    getSupportingData();
  }

  getSupportingData(){

    final UserDataProvider userDataProvider = Provider.of(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      userDataProvider.getData();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: MAppBar(ALL_ENQUIRY_TITLE),
        backgroundColor: APP_WHITE_COLOR,
        body: SafeArea(
          child: CircleAvatar(backgroundImage: CachedNetworkImageProvider('https://diwali2012.in/subho-nababarsha/'),),
        )
    );

  }
}
