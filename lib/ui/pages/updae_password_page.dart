import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/user_data_provider.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _conformPasswordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: "Please enter the password"),
    MinLengthValidator(5, errorText: "password must be at least 5 digits long"),
  ]);

  final conformPasswordValidator = MultiValidator(
      [RequiredValidator(errorText: "Please conform the password")]);

  String password;

  @override
  Widget build(BuildContext context) {
    UserDataProvider userDataProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: APP_WHITE_COLOR,
      appBar: AppBar(
        title: Text(
          'Set Password',
          style: AppFontStyle.headingTextStyle(APP_WHITE_COLOR),
        ),
        backgroundColor:PRIMARY_COLOR,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/image 2.jpg"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: LINE_HEIGHT * 0.5),
                    TextFormField(
                      controller: _newPasswordController,
                      validator: passwordValidator,
                      onChanged: (val) => password = val,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: NEW_PASSWORD,
                          labelStyle:
                          AppFontStyle.labelTextStyle(APP_BLACK_COLOR),
                          enabledBorder: AppBorderStyle.getFormBorder(),
                          focusedBorder: AppBorderStyle.getFormBorder(
                              color: APP_BLACK_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT * 0.5),
                    TextFormField(
                      controller: _conformPasswordController,
                      validator: (val) =>
                          MatchValidator(errorText: "passwords do not match")
                              .validateMatch(val, password),
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: CONFORM_PASSWORD,
                          labelStyle:
                          AppFontStyle.labelTextStyle(APP_BLACK_COLOR),
                          enabledBorder: AppBorderStyle.getFormBorder(),
                          focusedBorder: AppBorderStyle.getFormBorder(
                              color: APP_BLACK_COLOR)),
                    ),
                    SizedBox(height: LINE_HEIGHT),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                            bool status = await userDataProvider.updatePassword(_newPasswordController.text);
                            if(status){
                              Navigator.popUntil(context, (route) => route.settings.name==LOGIN_PAGE);
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
                        }
                      },
                      color: PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            CHANGE_PASSWORD,
                            style:
                            AppFontStyle.labelTextStyle(APP_WHITE_COLOR),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: APP_WHITE_COLOR,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
