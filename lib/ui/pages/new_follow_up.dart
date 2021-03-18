import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/follow_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/SubAppBar.dart';
import 'package:sales_popular/ui/widget/booking.dart';
import 'package:sales_popular/ui/widget/enquiry_lost.dart';
import 'package:sales_popular/ui/widget/schedule_later.dart';

class NewFollow extends StatefulWidget {
  @override
  _NewFollowState createState() => _NewFollowState();
}

class _NewFollowState extends State<NewFollow> {

  int radioValue;

  @override
  void initState() {
    super.initState();
  }

  @override


  Widget build(BuildContext context) {

    FollowProvider followProvider = Provider.of(context);
    FormData formData  = Provider.of(context);

    return Scaffold(
      appBar: MAppBar(FOLLOW_UP),
      backgroundColor: APP_WHITE_COLOR,
          body: SingleChildScrollView(
            child: SafeArea(

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mr. Ashwin Thomas',style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),),
                      SizedBox(height: 6,),
                      Text('Maruti Suzuki Celerio',style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR),),
                      SizedBox(height: 24,),
//                      Row(
//                        children: [
//                          Flexible(flex: 1,child: Text('Case punched on:', style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),)),
//                          SizedBox(width: 16,),
//                          Flexible(flex: 1,child: Text('11 OCT 2020',style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR),),)
//                        ],
//                      ),
//                      SizedBox(height: 6,),
//                      Row(
//                        children: [
//                          Flexible(flex: 1,child: Text('Last call on:', style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR))),
//                          SizedBox(width: 16,),
//                          Flexible(flex: 1,child: Text('18 OCT 2020', style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR)))
//                        ],
//                      ),
//                      SizedBox(height: 16,),

                      Container(
                        height: 50,

                        child: ListView(
                            scrollDirection: Axis.horizontal,

                            children: <Widget>[
                              followWidget(context, Colors.orangeAccent, 'Schedule Later', 0, followProvider),
                              SizedBox(width: 12,),
                              followWidget(context, Colors.redAccent, 'Enquiry Lost', 1, followProvider),
                              SizedBox(width: 12,),
                              followWidget(context, Colors.green, 'Booking', 2, followProvider),
                            ],
                          ),
                      ),
                      SizedBox(height: 12,),
                      getSupportingWidget(followProvider.selectedFollowip,formData)
                          ],
                  )
                ),
                      ),
          )

                );


  }

  getSupportingWidget(int selectedFollowip, FormData formData) {
    switch(selectedFollowip){
      case 0:{
        return Schedule();
      }
      case 1:{
        return EnquiryLost();
      }
      case 2:{
        return Booking(formData);
      }
    }
  }
}

Widget followWidget(BuildContext context,Color color, String text, int value , FollowProvider followProvider){
  return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          shape: BoxShape.rectangle
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
              ),
              child: Radio(
                value: value,
                activeColor: Colors.white,
                groupValue: followProvider.selectedFollowip,
                onChanged: (val)=>followProvider.selectedFollowip=val,
              ),
            ),
            new Text(text,style: AppFontStyle.labelTextStyle(APP_WHITE_COLOR),),
          ],
        ),
      )
  );
}