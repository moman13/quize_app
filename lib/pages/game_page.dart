import 'package:flutter/material.dart';
import 'package:friviaa/providers/game_page_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  GamePageProvider? _pageProvider;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(context: context),
      child: _buildUI(_deviceHeight),
    );
  }

  Widget _buildUI(_deviceHeight) {
    return Builder(builder: (context) {
      _pageProvider = context.watch<GamePageProvider>();
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceHeight! * 0.05),
            child: _gameUI(_deviceHeight),
          ),
        ),
      );
    });
  }

  Widget _gameUI(_deviceHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(_deviceHeight),
        Column(
          children: [
            _trueButton(_deviceHeight),
            SizedBox(
              height: 10,
            ),
            _falseButton(_deviceHeight),
          ],
        )
      ],
    );
  }

  Widget _questionText(_deviceHeight) {
    return const Text(
      'Test Question 1, Nothing Interested ',
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
    );
  }

  Widget _trueButton(_deviceHeight) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      minWidth: _deviceHeight * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        'True',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget _falseButton(_deviceHeight) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.red,
      minWidth: _deviceHeight * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        'False',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
