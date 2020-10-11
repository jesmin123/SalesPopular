import 'package:flutter/material.dart';
import 'package:sales_popular/api/api.dart';

class FormData extends ChangeNotifier{

    List<String> _customerType = new List();

    List<String> get customerType => _customerType;

    set customerType(List<String> value) {
      _customerType = value;
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