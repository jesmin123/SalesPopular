
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _empController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final singleValidator = MultiValidator([
    RequiredValidator(errorText: 'this field is required'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter the password"),
    MinLengthValidator(5, errorText: "password must be at least 5 digits long"),
  ]);

  final conformPasswordValidator = MultiValidator(
      [RequiredValidator(errorText: "Please conform the password")]);
  final _formKey = GlobalKey<FormState>();
   String password;

  @override
  Widget build(BuildContext context) {
    UserDataProvider userDataProvider = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
       title: Text('Register Your Account',style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR)),
        backgroundColor: PRIMARY_COLOR,
      ),
      body:
       Padding(
         padding: const EdgeInsets.all(12.0),
         child: Form(
           key: _formKey,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: LINE_HEIGHT,),

                  TextFormField(
                    validator: singleValidator,
                    keyboardType: TextInputType.text,
                    controller: _empController,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "Emp Code",
                      labelStyle: AppFontStyle.labelTextStyle(APP_BLACK_COLOR),
                      enabledBorder: AppBorderStyle.getFormBorder(),
                      focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                    ),
                  ),
              SizedBox(height: LINE_HEIGHT,),
                    TextFormField(
                                        validator: (val){
                      if(val.isEmpty){
                      return "this field is required";
                      }
                      else{
                      return null;
                      }
                      },
                      keyboardType: TextInputType.phone,
                      controller: _mobileController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Mobile",
                        labelStyle: AppFontStyle.labelTextStyle(APP_BLACK_COLOR),
                        enabledBorder: AppBorderStyle.getFormBorder(),
                        focusedBorder: AppBorderStyle.getFormBorder(color: PRIMARY_COLOR),
                      ),
                    ),
              SizedBox(height: LINE_HEIGHT,),

                Container(
                  width: 360,
                  child: RaisedButton(

                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          bool status  = await userDataProvider.registerUser(_empController.text,_mobileController.text,_passwordController.text);
                          if(status){
                            Navigator.pushReplacementNamed(context, OTP_PAGE);
                          }else{
                            Fluttertoast.showToast(
                                msg: "User not found",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        }
                      },

                    color: PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Register",
                          style: AppFontStyle.labelTextStyle(APP_WHITE_COLOR),),
                        Icon(Icons.keyboard_arrow_right, color: APP_WHITE_COLOR)

                      ],
                    ),
                  ),
                )


    ],),
         ),
       )
    );
  }
}