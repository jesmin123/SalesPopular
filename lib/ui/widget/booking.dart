import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/provider/follow_provider.dart';
class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
                Flexible(flex: 1,child: Text('Convert to booking')),
                Flexible(flex: 1,child: Switch(value: followProvider.bookingSwitch,
                  activeColor: PRIMARY_COLOR,
                  activeTrackColor: PRIMARY_COLOR,
                  onChanged: (value)=>followProvider.bookingSwitch=value,

                )),
              ],

            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1,child: Text("Booking branch")),
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

                          value: followProvider.bookingBranch,
                          items: [
                            DropdownMenuItem(
                              child: Text("SPM_ANG"),
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
                          onChanged: (int value)=>followProvider.bookingBranch = value,


                        ),
                      ),
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



              },
            ),

          ],
        ),
      ),


    );
  }
}
