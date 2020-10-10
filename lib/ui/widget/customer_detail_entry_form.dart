import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class CustomerDetailEntryForm extends StatelessWidget {

  final FormData _formData;

  CustomerDetailEntryForm(this._formData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            border: Border.all(width: BORDER_WIDTH,color:APP_BORDER_COLOR,)
          ),
          child: DropdownButton(
              underline: Container(),
              hint: Text('Select customer type'),
              icon: Icon(Icons.keyboard_arrow_down),
              items: _formData.customerType.map((e){
                return DropdownMenuItem(child: Text(e),value: e,);
              }).toList(),
              onChanged: onCustomerTypeChanged
          ),
        ),
        SizedBox(height: LINE_HEIGHT,),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
            labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
            enabledBorder: AppBorderStyle.getFormBorder(),
            focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
          ),

        )
      ],
    );
  }

  void onCustomerTypeChanged(value) {
  }
}
