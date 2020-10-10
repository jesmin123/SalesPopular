import 'package:flutter/material.dart';
import 'package:sales_popular/provider/form_data_provider.dart';

class CustomerDetailEntryForm extends StatelessWidget {
  FormData _formData;

  CustomerDetailEntryForm(this._formData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            hint: Text('Select customer type'),
            items: _formData.customerType.map((e){
              return DropdownMenuItem(child: Text(e),value: e,);
            }).toList(),
            onChanged: onCustomerTypeChanged
        )
      ],
    );
  }

  void onCustomerTypeChanged(value) {
  }
}
