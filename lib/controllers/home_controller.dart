import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
    bool isRightDoorLocked = true;
    bool isLeftDoorLocked = true;
    bool isTrunkLocked = true;
    bool isBonnetLocked = true;
    int selectedBottomTab = 0;


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

    






}
