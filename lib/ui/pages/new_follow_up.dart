import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/follow_provider.dart';
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
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Flexible(flex: 1,child: Text('Case punched on:')),
                          SizedBox(width: 16,),
                          Flexible(flex: 1,child: Text('11 OCT 2020'),)
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Flexible(flex: 1,child: Text('Last call on:')),
                          SizedBox(width: 16,),
                          Flexible(flex: 1,child: Text('18 OCT 2020'))
                        ],
                      ),
                      SizedBox(height: 16,),

                      Container(
                        height: 50,

                        child: ListView(
                            scrollDirection: Axis.horizontal,

                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.rectangle
                                  ),
                               child: Padding(
                                 padding: const EdgeInsets.all(6.0 ),
                                 child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      new Radio(

                                        value: 0,
                                        activeColor: Colors.white,
                                        groupValue: followProvider.selectedFollowip,
                                        onChanged: (val){followProvider.selectedFollowip = val;
                                        }

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: new Text(
                                          'Schedule Later  ',style: TextStyle(color: Colors.white),

                                        ),
                                      ),
                                    ],
                                  ),
                               )
                              ),
                              SizedBox(width: 4,),

                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(50),
                                      shape: BoxShape.rectangle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        new Radio(
                                          value: 1,
                                          activeColor: Colors.white,
                                          groupValue: followProvider.selectedFollowip,
                                          onChanged: (val)=>followProvider.selectedFollowip = val,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: new Text(
                                            'Enquiry Lost',style: TextStyle(color: Colors.white)

                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              SizedBox(width: 4,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                      shape: BoxShape.rectangle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        new Radio(
                                          value: 2,
                                          activeColor: Colors.white,
                                          groupValue: followProvider.selectedFollowip,
                                          onChanged: (val)=>followProvider.selectedFollowip=val,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right:12.0),
                                          child: new Text(
                                            'Booking',style: TextStyle(color: Colors.white)

                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                      ),
                      getSupportingWidget(followProvider.selectedFollowip)
                          ],
                  )
                ),
                      ),
          )

                );


  }

  getSupportingWidget(int selectedFollowip) {
    switch(selectedFollowip){
      case 0:{
        return Schedule();
      }
      case 1:{
        return EnquiryLost();
      }
      case 2:{
        return Booking();
      }
    }
  }
}

