import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimen.dart';

class AppBorderStyle{

  static OutlineInputBorder getFormBorder({Color color}){
    return  OutlineInputBorder(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        borderSide: BorderSide(width: BORDER_WIDTH,color: color!=null?color:APP_BORDER_COLOR,)
    );
  }

  static BoxDecoration appFormBorder({Color color}){
    return  BoxDecoration(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        border: Border.all(width: BORDER_WIDTH,color:APP_BORDER_COLOR,)
    );
  }

  static RoundedRectangleBorder appButtonShape({Color color}){
    return   RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS));

  }
}