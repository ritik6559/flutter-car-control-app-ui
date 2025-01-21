import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';


class CarAppNavBar extends StatelessWidget {
  const CarAppNavBar({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: List.generate(
        navIconSrc.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            navIconSrc[index],
            color: index == selectedTab ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
      ),
    );
  }
}

List<String> navIconSrc = [
  "assets/Lock.svg",
  "assets/Charge.svg",
  "assets/Temp.svg",
  "assets/Tyre.svg",
];
