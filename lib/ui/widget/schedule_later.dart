

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/provider/follow_provider.dart';
import 'package:sales_popular/ui/widget/enquiry_lost.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  TextEditingController _followUp = new TextEditingController();
  TextEditingController _followUpDate = new TextEditingController();
  FocusNode f1 = FocusNode();
  @override
  Widget build(BuildContext context) {

    FollowProvider followProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: Column(
          children: [
            rowWidget('Next follow up date',
            Container(
              height: 40,
              child: TextFormField(
                controller: _followUpDate,
                focusNode: f1,
                onTap: () async {
                  f1.unfocus();
                  DateTime dt = await DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2100, 6, 7),
                      onConfirm: (date) {},
                      currentTime: DateTime.now(), locale: LocaleType.en);
                      dt = dt!=null?dt:DateTime.now();
                      _followUpDate.text = dt.toString().substring(0,10);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                  contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  hintText: "pick a date",
                  hintStyle: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),
                ),
              ),
            )
            ),
            SizedBox(height: 12,),
            rowWidget("Open reason",
                Container(
                  height: 40,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    ),
                      items: [
                        DropdownMenuItem(
                          child: Text("Waiting period", ),
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
                )
            ),
            SizedBox(height: 12,),
            rowWidget("Enquiry status",
                Container(
                  height: 40,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    ),
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
                )
            ),
            SizedBox(height: 12,),
            rowWidget("Instruction for follow up",
                Container(
                  height: 40,
                  child: TextFormField(
                    controller: _followUp,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    ),
                  ),
                )
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

