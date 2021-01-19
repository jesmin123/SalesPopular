import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/user_data_provider.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {

    UserDataProvider userDataProvider = Provider.of(context);

    return Scaffold(
      appBar:  AppBar(
        title: Text('Enter OTP',style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR)),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter OTP',style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR)),
            SizedBox(height: 24,),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 80,
              style: TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async {
                Navigator.pushReplacementNamed(context, NEW_PASSWORD_PAGE);
                bool status = await userDataProvider.registerOtp(pin);
                if(status){
                    Navigator.pushReplacementNamed(context, NEW_PASSWORD_PAGE);
                }else{
                  Fluttertoast.showToast(
                      msg: "Wrong OTP",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
