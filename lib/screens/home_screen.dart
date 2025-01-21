import 'package:flutter/material.dart';
import 'package:flutter_car_control_app_ui/controllers/home_controller.dart';
import 'package:flutter_car_control_app_ui/screens/components/door_lock.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


    final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
    animation: _controller,
      builder: (context, snapshot) {
        return Scaffold(
            body: SafeArea(
                child: LayoutBuilder(
                    builder: (context, constrains){
                        return Stack(
                            alignment: Alignment.center,
                            children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: constrains.maxHeight * 0.11),
                                    child: SvgPicture.asset(
                                        'assets/Car.svg',
                                        width: double.infinity,
                                    ),
                                ),
                                Positioned(
                                    right: constrains.maxWidth * 0.05,
                                    child: DoorLock(
                                        press: _controller.updateRightDoorLock,
                                        isLock: _controller.isRightDoorLocked,
                                    )
                                ),
                                Positioned(
                                    left: constrains.maxWidth * 0.05,
                                    child: DoorLock(
                                        press: _controller.updateLeftDoorLock,
                                        isLock: _controller.isLeftDoorLocked,
                                    )
                                ),
                                Positioned(
                                    top: constrains.maxHeight * 0.13,
                                    child: DoorLock(
                                        press: _controller.updateBonnetLock,
                                        isLock: _controller.isBonnetLocked,
                                    )
                                ),
                                Positioned(
                                    bottom: constrains.maxHeight * 0.17,
                                    child: DoorLock(
                                        press: _controller.updateTrunkDoorLock,
                                        isLock: _controller.isTrunkLocked,

                                    )
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


