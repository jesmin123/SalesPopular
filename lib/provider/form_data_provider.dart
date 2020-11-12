import 'package:flutter/material.dart';
import 'package:sales_popular/api/api.dart';

class FormData extends ChangeNotifier {
  void initDataLoading() {
    getCustomerType();
    getSalutations();
    getStates();
    getCarMakes();
    getVillage();
    getTaluk();
    getDistrict();
    getCarModel();
    getCarVariant();
    getCarColor();
  }

  List<String> _customerType = new List();
  List<String> get customerType => _customerType;
  String selectedCustomerType;

  set customerType(List<String> value) {
    _customerType = value;
    notifyListeners();
  }

  void getCustomerType() {
    isCustomerTypeLoading = true;
    api.getData('getcustomertypes').then((value) {
      if (value.status) {
        customerType = new List<String>.from(value.data[0]['customerType']);
      }
    });
  }

  int _stepCount = 0;
  int get stepCount => _stepCount;

  set stepCount(int value) {
    _stepCount = value;
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
    notifyListeners();
  }

  String _selectedStates;

  String get selectedStates =>
      _selectedStates == null ? states[0] : _selectedStates;

  set selectedStates(String value) {
    _selectedStates = value;
    notifyListeners();
  }

  void getStates() {
    isStatesLoading = true;
    api.getData('getstates').then((value) {
      if (value.status) {
        states = new List<String>.from(value.data[0]['state']);
        isStatesLoading = false;
      }
    });
  }

  List<String> _salutations = new List();
  List<String> get salutations => _salutations;

  set salutations(List<String> value) {
    _salutations = value;
    notifyListeners();
  }

  void getSalutations() {
    isSalutationLoading = true;
    api.getData('getsalutations').then((value) {
      if (value.status) {
        isSalutationLoading = false;
        salutations = new List<String>.from(value.data[0]['salutation']);
      }
    });
  }

  String selectedCarMake;
  List<String> _carMake = new List();
  List<String> get carMake => _carMake;

  set carMake(List<String> value) {
    _carMake = value;
    notifyListeners();
  }

  void getCarMakes() {
    isCarMakeLoading = true;
    api.getData('getcarmakes').then((value) {
      if (value.status) {
        isCarMakeLoading = false;
        carMake = new List<String>.from(value.data[0]['carMake']);
      }
    });
  }

  String selectedModel;
  List<dynamic> _carModel = new List();

  List<dynamic> get carModel {
    List carmodels = new List();
    _carModel.forEach((element) {
      carmodels.add(element['carModel']);
    });
    return [
      ...{...carmodels}
    ];
  }
  set carModel(List<dynamic> value) {
    _carModel = value;
    notifyListeners();
  }



  List<Map<String, dynamic>> _carVariant = new List();
  List<Map<String, dynamic>> get carVariant => _carVariant;
  String selectedVariant;

  set carVariant(List<Map<String, dynamic>> value) {
    _carVariant = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> _carColor = new List();


  List<Map<String, dynamic>> get carColor => _carColor;

  set carColor(List<Map<String, dynamic>> value) {
    _carColor = value;
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

  set isCarMakeLoading(bool value) {
    _isCarMakeLoading = value;
    notifyListeners();
  }

  void getVillage() {
    api.getData('getvillages').then((value) {
      if (value.status) {
        villages = new List<String>.from(value.data[0]['villages']);
      }
    });
  }

  void getTaluk() {}

  void getDistrict() {
    api.getData('getdistricts').then((value) {
      if (value.status) {
        districts = new List<String>.from(value.data[0]['districts']);
      }
    });
  }

  void getCarModel() {
    api.getData('getcarmodels').then((value) {
      if (value.status) {
        carModel = new List<dynamic>.from(value.data['carModels']);
      }
    });
  }

  void getCarVariant() {
    api.getData('getcarvariants').then((value) {
      if (value.status) {
        print(value.data.toString());
        carVariant =
            new List<Map<String, dynamic>>.from(value.data['carVariants']);
      }
    });
  }

  void getCarColor() {
    api.getData('getcarcolours').then((value){
      if(value.status){
        carColor = new List<Map<String, dynamic>>.from(value.data['carColours']);
      }
    });
  }
}
