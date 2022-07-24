import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // Object _callAPI() async {
  //   var url = Uri.parse("http://localhost:3011/local/menus");
  //   var response = await http.get(url);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          children: [
            // Center(
            //   child: RaisedButton(
            //     child: Text('Second'),
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/second');
            //     },
            //   ),
            // ),
            Center(
              child: ElevatedButton(
                child: Text('Order'),
                onPressed: () {
                  Navigator.pushNamed(context, '/order');
                },
              ),
            ),
          ],
        ));
  }
}
