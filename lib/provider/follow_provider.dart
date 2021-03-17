import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sales_popular/model/CaseModel.dart';

class FollowProvider extends ChangeNotifier{

int _selectedFollowip = 0;
int _openReason =0;
int _enquiryStatus=0;
String _instruction="";
bool _enquirySwitch = false;
int _enquiryLostReason= 0;
int _coDealer=0;
bool _bookingSwitch=false;
int _bookingBranch = 0;
DateTime _nextFollowUpDate;

DateTime get nextFollowUpDate => _nextFollowUpDate;

  set nextFollowUpDate(DateTime value) {
    _nextFollowUpDate = value;
    notifyListeners();
  }

  int get bookingBranch => _bookingBranch;

  set bookingBranch(int value) {
    _bookingBranch = value;
    notifyListeners();
  }

  bool get bookingSwitch => _bookingSwitch;

  set bookingSwitch(bool value) {
    _bookingSwitch = value;
    notifyListeners();
  }

  int get coDealer => _coDealer;

  set coDealer(int value) {
    _coDealer = value;
    notifyListeners();
  }

  int get enquiryLostReason => _enquiryLostReason;

  set enquiryLostReason(int value) {
    _enquiryLostReason = value;
    notifyListeners();
  }

  bool get enquirySwitch => _enquirySwitch;

  set enquirySwitch(bool value) {
    _enquirySwitch = value;
    notifyListeners();
  }

  String get instruction => _instruction;

  set instruction(String value) {
    _instruction = value;
    notifyListeners();
  }

  int get enquiryStatus => _enquiryStatus;

  set enquiryStatus(int value) {
    _enquiryStatus = value;
    notifyListeners();
  }

  int get openReason => _openReason;

  set openReason(int value) {
    _openReason = value;
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
}