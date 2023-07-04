import 'package:flutter/material.dart';
import 'package:friviaa/providers/game_page_provider.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text("FRIVIAA",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              Text("defultes",
                  style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            minWidth: _deviceHeight! * 0.40,
            height: _deviceHeight! * 0.10,
            child: const Text(
              'Start',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
