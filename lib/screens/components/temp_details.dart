import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_car_control_app_ui/constants.dart';
import 'package:flutter_car_control_app_ui/controllers/home_controller.dart';
import 'package:flutter_car_control_app_ui/screens/components/tmp_btn.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: defaultPadding,
          children: [
            TempBtn(
              asset: 'assets/coolShape.svg',
              title: "COOL",
              press: _controller.updateCoolSelected,
              isActive: _controller.isCoolSelected,
            ),
            TempBtn(
              asset: 'assets/heatShape.svg',
              title: 'Heat',
              isActive: !_controller.isCoolSelected,
              press: _controller.updateCoolSelected,
              activeColor: redColor,
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_up, size: 48),
            ),
            Text(
              "23" + "\u2103",
              style: TextStyle(fontSize: 86),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down, size: 48),
            ),
          ],
        ),
        Spacer(),
        Text("CURRENT TEMPERATURE"),
        const SizedBox(width: defaultPadding),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Inside".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "29" + "\u2103",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(width: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Outside".toUpperCase(),
                  style: TextStyle(color: Colors.white54),
                ),
                Text(
                  "35" + "\u2103",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

