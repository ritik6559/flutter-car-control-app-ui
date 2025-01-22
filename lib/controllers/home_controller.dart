import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
    bool isRightDoorLocked = true;
    bool isLeftDoorLocked = true;
    bool isTrunkLocked = true;
    bool isBonnetLocked = true;
    int selectedBottomTab = 0;
    bool isCoolSelected = true;
    bool isShowTyre = false;
    bool isShowTyreStatus = false;

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
    void onButtonNavigationTabChange(int index){
        selectedBottomTab = index;
        notifyListeners();
    }

    void updateRightDoorLock(){
        isRightDoorLocked = !isRightDoorLocked;
        notifyListeners();
    }

    void updateLeftDoorLock(){
        isLeftDoorLocked = !isLeftDoorLocked;
        notifyListeners();
    }

    void updateTrunkDoorLock(){
        isTrunkLocked = !isTrunkLocked;
        notifyListeners();
    }

    void updateBonnetLock(){
        isBonnetLocked = !isBonnetLocked;
        notifyListeners();
    }

    void updateCoolSelected(){
        isCoolSelected = !isCoolSelected;
        notifyListeners();
    }

    void showTyreController(int index){
        if( selectedBottomTab != 3 && index == 3){
            isShowTyre = true;
            Future.delayed(
              Duration( milliseconds: 400 ),
              (){
                  isShowTyre = true;
                  notifyListeners(); 
              }
            );
            notifyListeners();
        } else {
            isShowTyre = false; 
        }
    }






}
