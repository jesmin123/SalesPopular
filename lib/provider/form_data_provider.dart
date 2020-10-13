import 'package:flutter/material.dart';
import 'package:sales_popular/api/api.dart';

class FormData extends ChangeNotifier{

    List<String> _customerType = new List();

    List<String> get customerType => _customerType;

    set customerType(List<String> value) {
      _customerType = value;
      notifyListeners();
    }

    List<String> _villages = new List();

    List<String> get villages => _villages;

    set villages(List<String> value) {
      _villages = value;
      notifyListeners();
    }

    List<String> _taluks = new List();


    List<String> get taluks => _taluks;

    set taluks(List<String> value) {
      _taluks = value;
      notifyListeners();
    }

    List<String> _districts = new List();


    List<String> get districts => _districts;

    set districts(List<String> value) {
      _districts = value;
      notifyListeners();
    }

  List<String> _states = new List();

    List<String> get states => _states;

    set states(List<String> value) {
      _states = value;
    }

    List<String> _salutations = new List();

    List<String> get salutations => _salutations;

    set salutations(List<String> value) {
      _salutations = value;
    }

    List<String> _carMake = new List();

    List<String> get carMake => _carMake;

    set carMake(List<String> value) {
      _carMake = value;
      notifyListeners();
    }


    List<String> _carModel = new List();

    List<String> get carModel => _carModel;

    set carModel(List<String> value) {
      _carModel = value;
      notifyListeners();
    }

    List<String> _variant = new List();

    List<String> get variant => _variant;

    set variant(List<String> value) {
      _variant = value;
      notifyListeners();
    }

    List<String> _color = new List();
    List<String> get color => _color;
    set color(List<String> value) {
      _color = value;
      notifyListeners();
    }
    List<String> _likelyToPurchaseWithin = new List();
    List<String> get likelyToPurchaseWithin => _likelyToPurchaseWithin;
    set likelyToPurchaseWithin(List<String> value) {
      _likelyToPurchaseWithin = value;
      notifyListeners();
    }

    List<String> _followUpDate = new List();
    List<String> get followUpDate => _followUpDate;
    set followUpDate(List<String> value) {
      _followUpDate = value;
      notifyListeners();
    }

    List<String> _followUpTime = new List();
    List<String> get followUpTime => _followUpTime;
    set followUpTime(List<String> value) {
      _followUpDate = value;
      notifyListeners();
    }

    List<String> _scheduleCallOn = new List();
    List<String> get scheduleCallOn => _scheduleCallOn;
    set scheduleCallOn(List<String> value) {
      _scheduleCallOn = value;
      notifyListeners();
    }

    List<String> _assignToBranch = new List();
    List<String> get assignToBranch => _assignToBranch;
    set assignToBranch(List<String> value) {
      _assignToBranch = value;
      notifyListeners();
    }

    List<String> _testDriveDate = new List();
    List<String> get testDriveDate => _testDriveDate;
    set testDriveDate(List<String> value) {
      _testDriveDate = value;
      notifyListeners();
    }

    List<String> _testDriveTime = new List();
    List<String> get testDriveTime => _testDriveTime;
    set testDriveTime(List<String> value) {
      _testDriveTime = value;
      notifyListeners();
    }

    List<String> _evaluatorBranch = new List();
    List<String> get evaluatorBranch => _evaluatorBranch;
    set evaluatorBranch(List<String> value) {
      _evaluatorBranch = value;
      notifyListeners();
    }

    List<String> _evaluatorName = new List();
    List<String> get evaluatorName => _evaluatorName;
    set evaluatorName(List<String> value) {
      _evaluatorName = value;
      notifyListeners();
    }

    List<String> _salesExecutive = new List();
    List<String> get salesExecutive => _salesExecutive;
    set salesExecutive(List<String> value) {
    _salesExecutive = value;
    notifyListeners();
    }

    List<String> _paymentType = new List();
    List<String> get paymentType => _paymentType;
    set paymentType(List<String> value) {
    _paymentType = value;
    notifyListeners();
    }



    // Loaders
    bool _isCustomerTypeLoading = false;
    bool _isSalutationLoading = false;
    bool _isStatesLoading = false;
    bool _isCarMakeLoading = false;


    bool get isCustomerTypeLoading => _isCustomerTypeLoading;

    set isCustomerTypeLoading(bool value) {
      _isCustomerTypeLoading = value;
      notifyListeners();
    }

    bool get isSalutationLoading => _isSalutationLoading;

    set isSalutationLoading(bool value) {
      _isSalutationLoading = value;
      notifyListeners();
    }

    bool get isStatesLoading => _isStatesLoading;

    set isStatesLoading(bool value) {
      _isStatesLoading = value;
      notifyListeners();
    }

    bool get isCarMakeLoading => _isCarMakeLoading;

    //---------------------

    set isCarMakeLoading(bool value) {
      _isCarMakeLoading = value;
      notifyListeners();
    }
    
    void initDataLoading(){
      getCustomerType();
      getSalutations();
      getStates();
      getCarMakes();
    }

    void getCustomerType() {
      isCustomerTypeLoading = true;
      api.getData('getcustomertypes').then((value){
        if(value.status){
          customerType = new List<String>.from(value.data[0]['customerType']);
          isCustomerTypeLoading = false;
        }
      });

    }


    void getStates() {
      isStatesLoading = true;
      api.getData('getstates').then((value){
        if(value.status){
          states = new List<String>.from(value.data[0]['state']);
          isStatesLoading = false;
        }
      });
    }

    void getSalutations() {
      isSalutationLoading = true;
      api.getData('getsalutations').then((value){
        if(value.status){
          salutations = new List<String>.from(value.data[0]['salutation']);
          isSalutationLoading = false;
        }
      });
    }

    void getCarMakes() {
      isSalutationLoading = true;
      api.getData('getcarmakes').then((value){
        if(value.status){
          carMake = new List<String>.from(value.data[0]['carMake']);
          isSalutationLoading = false;
        }
      });
    }

}