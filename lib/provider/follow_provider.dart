import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sales_popular/model/CaseModel.dart';

class FollowProvider extends ChangeNotifier{

int _selectedFollowip = 0;
String _openReason;
String _enquiryStatus;
bool _enquirySwitch = false;
String _enquiryLostReason;
String _coDealer;
bool _bookingSwitch=false;
String _bookingBranch;


String get enquiryStatus => _enquiryStatus;

  set enquiryStatus(String value) {
    _enquiryStatus = value;
    notifyListeners();
  }

  String get openReason => _openReason;

  set openReason(String value) {
    _openReason = value;
    notifyListeners();
  }

  String get coDealer => _coDealer;

  set coDealer(String value) {
    _coDealer = value;
    notifyListeners();
  }

  String get enquiryLostReason => _enquiryLostReason;

  set enquiryLostReason(String value) {
    _enquiryLostReason = value;
    notifyListeners();
  }

  String get bookingBranch => _bookingBranch;

  set bookingBranch(String value) {
    _bookingBranch = value;
    notifyListeners();
  }

  DateTime _nextFollowUpDate;

DateTime get nextFollowUpDate => _nextFollowUpDate;

  set nextFollowUpDate(DateTime value) {
    _nextFollowUpDate = value;
    notifyListeners();
  }


  bool get bookingSwitch => _bookingSwitch;

  set bookingSwitch(bool value) {
    _bookingSwitch = value;
    notifyListeners();
  }




  bool get enquirySwitch => _enquirySwitch;

  set enquirySwitch(bool value) {
    _enquirySwitch = value;
    notifyListeners();
  }


  int get selectedFollowip => _selectedFollowip;

set selectedFollowip(int value) {
  _selectedFollowip = value;
  notifyListeners();
}

DateTime _selectedValue;

DateTime get selectedValue => _selectedValue;

  set selectedValue(DateTime value) {
    _selectedValue = value;
  }

  List<CaseModel> _cases=[];

List<CaseModel> get cases => _cases;

  set cases(List<CaseModel> value) {
    _cases = value;
    notifyListeners();
  }

  selectScheduleLater(String date, String reason, String status, String followup){
    //TODO implement logic here
  }

  selectEnquiryLost(bool enquiry, String reason, String dealer){
    //TODO implement logic here
  }

  selectBoking(bool booking, String branch){
    //TODO implement logic here
  }

}