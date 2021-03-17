import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/provider/follow_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/ui/widget/enquiry_lost.dart';
class Booking extends StatefulWidget {
  final FormData _formData;

  Booking(this._formData);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    FollowProvider followProvider = Provider.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: Column(
          children: [
            rowWidget('Convert to booking',
                Switch(value: followProvider.bookingSwitch,
                  activeColor: PRIMARY_COLOR,
                  activeTrackColor: PRIMARY_COLOR,
                  onChanged: (value)=>followProvider.bookingSwitch=value,

                )
            ),
            SizedBox(height: 12,),
            rowWidget("Booking branch",
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
                    items: widget._formData.assignToBranch.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                    onChanged: (value)=>followProvider.bookingBranch = value,
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



              },
            ),

          ],
        ),
      ),


    );
  }
}
