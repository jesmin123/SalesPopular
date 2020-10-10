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
}