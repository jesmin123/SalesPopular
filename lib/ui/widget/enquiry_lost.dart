import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/provider/follow_provider.dart';
class EnquiryLost extends StatefulWidget {
  @override
  _EnquiryLostState createState() => _EnquiryLostState();
}

class _EnquiryLostState extends State<EnquiryLost> {
  @override
  Widget build(BuildContext context) {
    FollowProvider followProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: Column(
          children: [
            rowWidget('Enquiry lost',
                Switch(
                  value: followProvider.enquirySwitch,
                  activeColor: PRIMARY_COLOR,
                  activeTrackColor: PRIMARY_COLOR,
                  onChanged: (value)=>followProvider.enquirySwitch=value,

                )
            ),
            SizedBox(height: 12),
            rowWidget("Enquiry lost reason",
                Container(
                  height: 40,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("Lost to co-dealer"),
                        value: "Lost to co-dealer",
                      ),

                    ],
                    onChanged: (value)=>followProvider.enquiryLostReason = value,
                  ),
                )
            ),
            SizedBox(height: 12,),
            rowWidget("Co dealer",
                Container(
                  height: 40,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey[200])),
                      contentPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("Indus"),
                        value: "Indus",
                      ),

                    ],
                    onChanged: (value)=>followProvider.coDealer = value,

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
                followProvider.selectEnquiryLost(followProvider.enquirySwitch, followProvider.enquiryLostReason, followProvider.coDealer);
              },
            ),

          ],
        ),
      ),


    );
  }
}

Widget rowWidget(String text, Widget widget){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(flex: 1,child: Text(text, style: AppFontStyle.labelTextStyle2(APP_BLACK_COLOR),)),
      Flexible(flex: 1,child: widget)
    ],

  );
}
