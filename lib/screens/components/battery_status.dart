import 'package:flutter/material.dart';

import '../../constants.dart';

class BatteryStatus extends StatelessWidget {
  final BoxConstraints constrains;
  const BatteryStatus({
      required this.constrains,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
           Text(
               "220 mi",
               style: TextStyle(
                   fontSize: 30,
                   color: Colors.white
               )
           ),
           Text(
               "62%",
               style: TextStyle(
                   fontSize: 24,
               ),
           ),
           Spacer(),
           Text(
               "CHARGING",
               style: TextStyle(
                   fontSize: 20,
               ),
           ),
           Text(
               "18 min remaining",
               style: TextStyle(
                   fontSize: 20,
               ),
           ),
           SizedBox(height: constrains.maxHeight * 0.14,),
           DefaultTextStyle(
           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                     Text("22 mi/hr"),
                     Text("232 v"),
                 ],
             ),
           ),
           const SizedBox(height: defaultPadding,),
       ],
       
    );
  }
}


