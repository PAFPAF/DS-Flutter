import 'package:dark_souls/data/bosses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? boss;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SideMenu(),
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.green,
                          child: Image.asset(
                            'assets/images/bosses/$boss.png',
                          ),
                        ),
                        DropdownButton(
                          value: boss,
                          items: Bosses().ds1.map(createListItem).toList(),
                          onChanged: (boss) =>
                              setState(() => this.boss = boss as String?),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 80.0),
                        child: Row(
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/hud_ui_slot.png',
                                  ),
                                ]),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/hud_ui_slot.png',
                                ),
                                Image.asset(
                                  'assets/images/hud_ui_slot.png',
                                ),
                              ],
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/hud_ui_slot.png',
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}

DropdownMenuItem<String> createListItem(title) =>
    DropdownMenuItem(value: title, child: Text(title));

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 720
        ? Container(
            width: 200,
            color: Colors.black54,
          )
        : Container();
  }
}
