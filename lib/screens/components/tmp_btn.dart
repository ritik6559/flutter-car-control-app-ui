
import 'package:flutter/material.dart';
import 'package:flutter_car_control_app_ui/constants.dart';
import 'package:flutter_svg/svg.dart';

class TempBtn extends StatelessWidget {
    final String asset;
    final String title;
    final bool isActive;
    final VoidCallback press;
    final Color activeColor;
  const TempBtn({
    super.key,
    required this.asset,
    required this.title,
    required this.isActive,
    required this.press,
    this.activeColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: press,
      child: Column(
      spacing: defaultPadding / 2,
         children: [
             AnimatedContainer(
             curve: Curves.easeInOutBack,
                duration: Duration(milliseconds: 200),
                 width: isActive ? 76 : 50,
                 height: isActive ? 76 : 50,
                 child: SvgPicture.asset(
                     asset, 
                     color: isActive ? activeColor : Colors.white38,
                 ),
             ),
             AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
              style: TextStyle(
                       fontSize: 14,
                       color: isActive ? activeColor : Colors.white38,
                       fontWeight: isActive ? FontWeight.bold : FontWeight.normal
                   ), 
               child: Text(
                    title.toUpperCase(), 
               ),
             ),
         ],
      ),
    );
  }
}


