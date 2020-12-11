import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales_popular/constants/app_font_style.dart';
import 'package:sales_popular/constants/colors.dart';
import 'package:sales_popular/constants/dimen.dart';
import 'package:sales_popular/model/CaseModel.dart';

class CasesItemWidget extends StatefulWidget {

  final CaseModel caseModel;

  CasesItemWidget(this.caseModel);

  @override
  _CasesItemWidgetState createState() => _CasesItemWidgetState();
}

class _CasesItemWidgetState extends State<CasesItemWidget> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: ()=>onItemPressed(),
      leading: Padding(
        padding: const EdgeInsets.only(top: LIST_TILE_PADDING),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("10:00 AM", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR), ),
            VerticalDivider(),
          ],
        ),
      ),
      title: Text('Mr. Ravi Aswin', style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
      subtitle: Text('Maruti Suzuki Celerio', style: AppFontStyle.bodyTextStyle(APP_BLACK_COLOR),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" ", style: AppFontStyle.bodyTextStyle(PRIMARY_COLOR),),
          SizedBox(width: 16,),
          Icon(LineIcons.arrow_circle_right)
        ],
      )
    );

  }

  onItemPressed() {
    //TODO Implement logic here
  }


}