import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'language_manager.dart';

class Ship1 extends StatefulWidget {
  const Ship1({super.key});

  @override
  State<Ship1> createState() => _ShipState();
}

List<String> options = ["Option 0","Option 1"];

class _ShipState extends State<Ship1> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
        children: [
        Image.asset(
        'assets/group.png',
        width: 24,
        height: 24,
    )
    /*RadioListTile(
              title: Text(LanguageManager.instance.getTranslatedValue('ship')),
              selectedTileColor: Color(0xff2e3b62),
              activeColor: Color(0xff2e3b62),
              subtitle: Text("Lorem ipsum dolor sit amet, \nconsectetur adipiscing"),
              value: options[0],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              } ,
            ),
            RadioListTile(
              title: Text(LanguageManager.instance.getTranslatedValue('trans')),
              activeColor: Color(0xff2e3b62),
              selectedTileColor: Color(0xff2e3b62),
              subtitle: Text("Lorem ipsum dolor sit amet, \nconsectetur adipiscing"),
              value: options[1],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              } ,
            ),*/

          ],
        ),
      ]),
    ));
  }
}
