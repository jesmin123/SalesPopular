

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/provider/follow_provider.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  TextEditingController _followUp = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    FollowProvider followProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1,child: Text('Next follow up date')),
                Flexible(flex: 1,child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    onPressed: (){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2100, 6, 7),
                          onConfirm: (date) => followProvider.nextFollowUpDate = date,
                          currentTime: DateTime.now(), locale: LocaleType.en);
                    },

                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_outlined),
                      SizedBox(width: 12,),
                      Text('Pick a date')
                    ],
                  )

                )),
              ],

            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1,child: Text("Open reason")),
                 Flexible(
                   flex: 1,
                   child: Container(
                     width: 260,
                     height: 40,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                       shape: BoxShape.rectangle,
                       color: Colors.grey[300]
                     ),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       child: DropdownButtonHideUnderline(
                         child: DropdownButton(

                             value: followProvider.openReason,
                             items: [
                               DropdownMenuItem(
                                 child: Text("Waiting period"),
                                 value: 0,
                               ),
                               DropdownMenuItem(
                                 child: Text("Second Item"),
                                 value: 1,
                               ),
                               DropdownMenuItem(
                                 child: Text("Third Item"),
                                 value: 2,
                               ),
                               DropdownMenuItem(
                                 child: Text("Fourth Item"),
                                 value: 3,
                               )
                             ],
                             onChanged: (int value)=>followProvider.openReason = value,


                         ),
                       ),
                     ),
                   ),
                 )
                ,
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1,child: Text("Enquiry status")),
                Flexible(
                  flex: 1,
                  child: Container(
                    height:40 ,
                    width: 260,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          value: followProvider.enquiryStatus,
                          items: [
                            DropdownMenuItem(
                              child: Text("Postponed"),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Third Item"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("Fourth Item"),
                              value: 3,
                            )
                          ],
                          onChanged: (int value)=>followProvider.enquiryStatus = value,


                        ),
                      ),
                    ),
                  ),
                )
                ,
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1,child: Text("Instruction for follow up")),
                Flexible(
                  flex: 1,
                  child: Container(
                    height:40 ,
                    width: 260,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: _followUp,

                      )


                    ),
                  ),
                )
                ,
              ],
            ),
            SizedBox(height: 20,),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(15),
                    color: Colors.teal),
                child: Center(child: Text('Save',style: AppFontStyle.labelTextStyle(APP_WHITE_COLOR)),),
                ),
              onTap: (){
                followProvider.instruction = _followUp.text;


              },
            ),

          ],
        ),
      ),


    );
  }
}
