import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class DoorLock extends StatelessWidget {
  final VoidCallback press;
  final bool isLock;
  const DoorLock({
    super.key,
    required this.press,
    required this.isLock,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: press,
      child: AnimatedSwitcher(
      switchInCurve: Curves.easeInOutBack,
      transitionBuilder: (child, animation){
          return ScaleTransition(
            scale: animation, 
            child: child,
        );
      },
      duration: defaultDuration,
        child: isLock ? 
          SvgPicture.asset('assets/door_lock.svg', key: ValueKey("lock"),) :
          SvgPicture.asset('assets/door_unlock.svg', key: ValueKey("unlock"),),
      ),
    );
  }
} 
