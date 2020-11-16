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
    getAssignToBranch();
  }

  int _activeStep = 0;

  int get activeStep => _activeStep;

  set activeStep(int value) {
    _activeStep = value;
    notifyListeners();
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

  List<Map<String, dynamic>> _villages = new List();
  List<Map<String, dynamic>> get villages => _villages;
  String selectedVillages;

  set villages(List<Map<String, dynamic>> value) {
    _villages = value;
    notifyListeners();
  }

  String selectedTaluk;
  List<dynamic> _taluks = new List();
  List<dynamic> get taluks{
    List taluks = new List();
    _taluks.forEach((element) {
      taluks.add(element['taluk']);
    });
    return [
      ...{...taluks}
    ];
  }


  set taluks(List<dynamic> value) {
    _taluks = value;
    notifyListeners();
  }

  String selectedDistrict;
  List<Map<String, dynamic>> _districts = new List();
  List<Map<String, dynamic>> get districts => _districts;

  set districts(List<Map<String, dynamic>> value) {
    _districts = value;
  }


  String selectedState;
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
  String selectedSalutations;

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

  List< dynamic> _carColor = new List();

  List<dynamic> get carColor {
    List carColours = new List();
    _carColor.forEach((element) {
      carColours.add(element['carColour']);
    });
    return [
      ...{...carColours}
    ];
  }

  String selectedCarColor;
  set carColor(List<dynamic> value) {
    _carColor = value;
  }

  List<String> _likelyToPurchaseWithin =  ["0 - 10 Days", "10 - 20 Days", "20 - 30 Days", "30 - 40 Days" ];

  List<String> get likelyToPurchaseWithin => _likelyToPurchaseWithin;
  String selectedLikelyToPurchaseWithin;

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

  String selectedBranch;
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
  bool _isTestDrive =  false;

  bool get isTestDrive => _isTestDrive;

  set isTestDrive(bool value) {
    _isTestDrive = value;
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
        villages = new List<Map<String, dynamic>>.from(value.data['villages']);
      }
    });
  }

  void getTaluk() {
    api.getData('gettalukas').then((value){
      if(value.status){
        taluks = new List<dynamic>.from(value.data['talukas']);
      }
    });
  }

  void getDistrict() {
    api.getData('getdistricts').then((value) {
      if (value.status) {
        districts = new List<Map<String, dynamic>>.from(value.data['districts']);
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
        print(value.data.toString());
        carColor = new List<dynamic>.from(value.data['carColours']);
      }
    });
  }

  void getAssignToBranch() {
    api.getData('getbranches').then((value){
      if(value.status){
        assignToBranch = new List<String>.from(value.data[0]['branch']);
      }
    });
  }
}

