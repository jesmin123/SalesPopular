
import 'package:flutter/material.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/globalkeys.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class CustomerDetailEntryForm extends StatefulWidget {

  final FormData _formData;
  final EnquiryProvider _enquiryData;

  CustomerDetailEntryForm(this._formData,this._enquiryData);

  @override
  _CustomerDetailEntryFormState createState() => _CustomerDetailEntryFormState();
}

class _CustomerDetailEntryFormState extends State<CustomerDetailEntryForm> {

  TextEditingController _nameController;

  _CustomerDetailEntryFormState(){
     _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: AppBorderStyle.appFormBorder(),
            child: DropdownButton(
                underline: Container(),
                hint: Text('Select customer type'),
                icon: Icon(Icons.keyboard_arrow_down),
                items: widget._formData.customerType.map((e){
                  return DropdownMenuItem(child: Text(e),value: e,);
                }).toList(),
                onChanged: onCustomerTypeChanged
            ),
          ),
          SizedBox(height: LINE_HEIGHT,),
          TextFormField(
            controller: _nameController,
            autofocus: false,
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: AppFontStyle.labelTextStyle(PRIMARY_COLOR),
              enabledBorder: AppBorderStyle.getFormBorder(),
              focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
            ),

          )
        ],
      ),
    );
  }

  void onCustomerTypeChanged(value) {

  }
}
