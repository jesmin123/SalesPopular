import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/strings.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _passwordController;
  TextEditingController _newPasswordController;
  TextEditingController _conformPasswordController;

  _ChangePasswordPageState() {
    _passwordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _conformPasswordController = TextEditingController();
  }

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
    return Scaffold(
      backgroundColor: APP_WHITE_COLOR,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: APP_WHITE_COLOR,
            )),
        title: Text(
          CHANGE_PASSWORD,
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
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the password";
                        }
                        return null;
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: PASSWORD,
                          labelStyle:
                              AppFontStyle.labelTextStyle(APP_BLACK_COLOR),
                          enabledBorder: AppBorderStyle.getFormBorder(),
                          focusedBorder: AppBorderStyle.getFormBorder(
                              color: APP_BLACK_COLOR)),
                    ),
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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Warning", style: AppFontStyle.headingTextStyle(APP_BLACK_COLOR),
                                      ),
                                      SizedBox(height: LINE_HEIGHT * 0.5),
                                      Text(
                                        "Are you sure you want to change your password",
                                        style: AppFontStyle.labelTextStyle(
                                            APP_BLACK_COLOR),
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(),
                                      SizedBox(height: LINE_HEIGHT * 0.2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "No",
                                              style:
                                                  AppFontStyle.labelTextStyle(
                                                      PRIMARY_COLOR),
                                            ),
                                          ),
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, SALES_APP_PAGE);
                                              },
                                              child: Text("Yes",
                                                  style: AppFontStyle
                                                      .labelTextStyle(
                                                          PRIMARY_COLOR)))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
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
