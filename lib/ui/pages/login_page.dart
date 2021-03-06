import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sales_popular/constants/app_border_style.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/model/RespObj.dart';
import 'package:sales_popular/provider/enquiry_provider.dart';
import 'package:sales_popular/provider/form_data_provider.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:provider/provider.dart';
import 'package:sales_popular/constants/strings.dart';
import 'package:sales_popular/provider/user_data_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_popular/utils/loaderUtilis.dart';

class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  TextEditingController _userIdController = new TextEditingController();
  TextEditingController _passwordController= new TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();



  @override
  void initState() {
    super.initState();
    getSupportingData();
  }

  getSupportingData(){

    final FormData formData = Provider.of(context,listen: false);
    final EnquiryProvider enquiryProvider = Provider.of(context,listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formData.initDataLoading();
      enquiryProvider.initData();
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserDataProvider userDataProvider = Provider.of(context);
    final FormData formData = Provider.of(context);
    return Scaffold(
      backgroundColor: APP_WHITE_COLOR,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Center(
          child: ListView(
              children: [
                Image.asset("assets/images/image 1.jpg"),
                SizedBox(height: LINE_HEIGHT,),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Please enter the User ID";
                    }
                    return null;
                  },
                  focusNode: f1,
                  controller: _userIdController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: AppBorderStyle.getFormBorder(),
                    focusedBorder: AppBorderStyle.getFormBorder(color: APP_BLACK_COLOR),
                    labelText: "User ID",
                    labelStyle: AppFontStyle.regularTextStyle(APP_BLACK_COLOR)
                  ),
                ),
                SizedBox(height: LINE_HEIGHT,),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Please enter the passwoord";
                    }
                    return null;
                  },
                  focusNode: f2,
                  controller: _passwordController,
                  obscureText: !formData.isPasswordShown,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: AppBorderStyle.getFormBorder(),
                      focusedBorder: AppBorderStyle.getFormBorder(color: APP_BLACK_COLOR),
                      labelText: "Password",
                      labelStyle: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),
                    suffixIcon: formData.isPasswordShown?IconButton(icon: Icon(Icons.visibility_off), onPressed: (){formData.isPasswordShown= false;},):IconButton(icon: Icon(Icons.visibility), onPressed: (){formData.isPasswordShown= true;},)
                  ),
                ),
                SizedBox(height: LINE_HEIGHT,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      FORGOT,
                      style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MY_PROFILE_PAGE);
                      },
                      child: Text(
                        " UserID / Password",
                        style: AppFontStyle.bodyTextStyle(PRIMARY_COLOR),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 180,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        f1.unfocus();
                        f2.unfocus();
                        Loader.getLoader(context).show();
                        RespObj res = await userDataProvider.login(_userIdController.text, _passwordController.text);
                        Loader.getLoader(context).hide();
                        if(res.status){
                          Navigator.pushNamed(context, HOME_PAGE);
                        }
                       else{
                          Fluttertoast.showToast(

                              msg: "Login Failed: Invalid mobile or password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
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
                        Text("Login",
                            style: AppFontStyle.labelTextStyle(APP_WHITE_COLOR)),
                        Icon(Icons.keyboard_arrow_right, color: APP_WHITE_COLOR)

                      ],
                    ),
                  ),

                ),


                InkWell(
                  child:  Text("Register",style: AppFontStyle.labelTextStyle(APP_BLACK_COLOR),textAlign: TextAlign.center),
                  onTap:() {Navigator.pushNamed(context, REGISTRATION_PAGE);},
                ),

                    ],
                  ),
                )

       ,
            ),
        ),
        );
  }
}
