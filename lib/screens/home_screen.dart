import 'package:flutter/material.dart';
import 'package:flutter_car_control_app_ui/constants.dart';
import 'package:flutter_car_control_app_ui/controllers/home_controller.dart';
import 'package:flutter_car_control_app_ui/screens/components/car_app_nav_bar.dart';
import 'package:flutter_car_control_app_ui/screens/components/door_lock.dart';
import 'package:flutter_svg/svg.dart';

import 'components/battery_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
    final HomeController _controller = HomeController();

    late AnimationController _batteryAnimationController;
    late Animation<double> _animationBattery;
    late Animation<double> _animationBatteryStatus;

    late AnimationController _tempAnimationController;
    late Animation<double> _animationCarShift;
    
    void setupTempAnimation(){
        _tempAnimationController = AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 1500),
        );
        _animationCarShift = CurvedAnimation(
            parent: _tempAnimationController, 
            curve: Interval(0, 0.2,),
         );
    }

    void setupBatteryAnimation(){
        _batteryAnimationController = AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 600)
        );

        _animationBattery = CurvedAnimation(
            parent: _batteryAnimationController, 
            curve: Interval(0.0, 0.5),
        );

        _animationBatteryStatus = CurvedAnimation(
            parent: _batteryAnimationController, 
            curve: Interval(0.6, 1,),
        );
    }

    @override
      void initState(){
        setupBatteryAnimation();
        setupTempAnimation();
        super.initState();
      }

      @override
        void dispose() {
          super.dispose();
          _batteryAnimationController.dispose();
          _tempAnimationController.dispose();
        }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
    animation: Listenable.merge({ _controller, _batteryAnimationController }),
      builder: (context, snapshot) {
        return Scaffold(
        bottomNavigationBar: CarAppNavBar(
            onTap: (index){
                if( index == 1 ){
                    _batteryAnimationController.forward();
                }
                else if ( _controller.selectedBottomTab == 1 && index != 1 ){
                    _batteryAnimationController.reverse(from: 0.7);
                }
                if( index == 2 ){
                    _tempAnimationController.forward();
                }
                else if( _controller.selectedBottomTab == 2 && index != 2 ){
                    _tempAnimationController.reverse();
                }
                _controller.onButtonNavigationTabChange(index);  
            },
            selectedTab: _controller.selectedBottomTab,
            ),  
            body: SafeArea(
                child: LayoutBuilder(
                    builder: (context, constrains){
                        return Stack(
                            alignment: Alignment.center,
                            children: [
                                SizedBox(
                                    height: constrains.maxHeight, 
                                    width: constrains.maxWidth,
                                ),
                                Positioned(
                                left: constrains.maxWidth / 2 * _animationCarShift.value,
                                height: constrains.maxHeight,
                                width: constrains.maxWidth,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: constrains.maxHeight * 0.11),
                                      child: SvgPicture.asset(
                                          'assets/Car.svg',
                                          width: double.infinity,
                                      ),
                                  ),
                                ),

                                AnimatedPositioned(
                                    duration: defaultDuration,
                                    right: _controller.selectedBottomTab == 0 ? constrains.maxWidth / 0.05 : constrains.maxWidth / 2,
                                    child: AnimatedOpacity(
                                    duration: defaultDuration,
                                    opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                                      child: DoorLock(
                                          press: _controller.updateRightDoorLock,
                                          isLock: _controller.isRightDoorLocked,
                                      ),
                                    )
                                ),
                                AnimatedPositioned(
                                    duration: defaultDuration,
                                    left: _controller.selectedBottomTab == 0 ? constrains.maxWidth * 0.05 : constrains.maxWidth / 2,
                                    child: AnimatedOpacity(
                                    duration: defaultDuration,
                                    opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                                      child: DoorLock(
                                          press: _controller.updateLeftDoorLock,
                                          isLock: _controller.isLeftDoorLocked,
                                      ),
                                    )
                                ),
                                AnimatedPositioned(
                                    duration: defaultDuration,
                                    top: _controller.selectedBottomTab == 0 ? constrains.maxHeight * 0.13 : constrains.maxHeight / 2,
                                    child: AnimatedOpacity(
                                    duration: defaultDuration,
                                    opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                                      child: DoorLock(
                                          press: _controller.updateBonnetLock,
                                          isLock: _controller.isBonnetLocked,
                                      ),
                                    )
                                ),
                                AnimatedPositioned(
                                duration: defaultDuration,
                                    bottom: _controller.selectedBottomTab == 0 ? constrains.maxHeight * 0.17 : constrains.maxHeight / 2,
                                    child: AnimatedOpacity(
                                    duration:defaultDuration,
                                    opacity: _controller.selectedBottomTab == 0 ? 0 : 1,
                                      child: DoorLock(
                                          press: _controller.updateTrunkDoorLock,
                                          isLock: _controller.isTrunkLocked,
                                      
                                      ),
                                    )
                                ),
                                
                                
                                    Opacity(
                                    opacity: _animationBattery.value,
                                      child: SvgPicture.asset(
                                          'assets/Battery.svg',
                                          width: constrains.maxWidth * 0.45,             
                                      ),
                                    ),
                                 Positioned(
                                 top: 50 * ( 1 - _animationBatteryStatus.value ),
                                 height: constrains.maxHeight,
                                 width: constrains.maxWidth,
                                   child: Opacity(
                                   opacity: _animationBatteryStatus.value,
                                   child: BatteryStatus(
                                      constrains: constrains,
                                     ),
                                                                   ),
                                 ),     

                            ],
                        )  ;
                    }
                )  
            )
        );
      }
    );
  }
}


