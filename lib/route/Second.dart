import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select what you want!"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // 현재 route를 스택에서 제거함으로써 첫 번째 스크린으로 되돌아 갑니다.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
