import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, Object>> _callAPI() async {
  var url = Uri.parse("http://localhost:3011/local/menus");
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // return response;
  // return response.map(res => [res: res]);
  return {
    "HOT 아메리카노": "Hot Americano",
    "ICE 아메리카노": "Ice Americano",
    "HOT 카페라떼": "Hot CafeLatte",
    "ICE 카페라떼": "Ice CafeLatte",
    "HOT 초코라떼": "Hot Chocolate",
    "ICE 초코라떼": "Ice Chocolate",
    "ICE 복숭아티": "복숭아티에 알싸한 홍차를 더한 깔끔한 맛"
  };
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Map<String, int> countToValue = <String, int>{};

  Future<Map<String, Object>> menuList = _callAPI();
  // {
  //   "HOT 아메리카노": "Hot Americano",
  //   "ICE 아메리카노": "Ice Americano",
  //   "HOT 카페라떼": "Hot CafeLatte",
  //   "ICE 카페라떼": "Ice CafeLatte",
  //   "HOT 초코라떼": "Hot Chocolate",
  //   "ICE 초코라떼": "Ice Chocolate",
  //   "ICE 복숭아티": "복숭아티에 알싸한 홍차를 더한 깔끔한 맛"
  // };

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      color: Colors.white,
      // padding: const EdgeInsets.all(32),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                "Menu",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Row(),
      //     Padding(
      //       padding:
      //           const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
      //       child: Container(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 8.0),
      //               child: Icon(
      //                 Icons.account_circle,
      //                 size: 45.0,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
      //               child: Text(
      //                 "Hello, Jane.",
      //                 style: TextStyle(fontSize: 30.0, color: Colors.white),
      //               ),
      //             ),
      //             Text(
      //               "Looks like feel good.",
      //               style: TextStyle(color: Colors.white),
      //             ),
      //             Text(
      //               "You have 3 tasks to do today.",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // Row(
      //   children: [
      //     Expanded(
      //       /*1*/
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           /*2*/
      //           Container(
      //             padding: const EdgeInsets.only(bottom: 8),
      //             child: Text(
      //               'Oeschinen Lake Campground',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           Text(
      //             'Kandersteg, Switzerland',
      //             style: TextStyle(
      //               color: Colors.grey[500],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     /*3*/
      //     Icon(
      //       Icons.star,
      //       color: Colors.red[500],
      //     ),
      //     Text('41'),
      //   ],
      // ),
    );

    Widget menuSection = Container(
      padding: const EdgeInsets.symmetric(
        // horizontal: 64.0,
        vertical: 32.0,
      ),
      // padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: ListTileTheme(
        child: ListView(
          children: [
            for (String menu in menuList.keys)
              Row(
                children: <Widget>[
                  Expanded(
                    // width: 300,
                    child: _buildMenuList(menuList, countToValue, menu),
                  ),
                  Spacer(),
                  ButtonBar(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: Colors.grey[400],
                        ),
                        onPressed: () {
                          setState(() {
                            int menuCount = countToValue[menu] ?? 0;
                            if (menuCount > 0)
                              countToValue[menu] = menuCount - 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    '${(countToValue[menu] ?? 0) > 0 ? countToValue[menu] : 0}',
                  ),
                  ButtonBar(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.lightGreen[200],
                        ),
                        onPressed: () {
                          setState(() {
                            int menuCount = countToValue[menu] ?? 0;
                            if (menuCount < 5)
                              countToValue[menu] = menuCount + 1;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),

            ///
            // ListTile(
            //   // shape: RoundedRectangleBorder(
            //   //   borderRadius: BorderRadius.circular(15),
            //   //   // side: BorderSide(
            //   //   //   color: Colors.black,
            //   //   // ),
            //   // ),
            //   title: Text(
            //     '$menu',
            //     style: TextStyle(
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //       // color: Colors.indigo,
            //     ),
            //   ),
            //   isThreeLine: false,
            //   subtitle: Text(
            //     '${menuList[menu]}',
            //     style: TextStyle(
            //       fontSize: 13.0,
            //       color: Colors.grey[350],
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            //   leading: CircleAvatar(
            //     backgroundColor: Colors.black,
            //     radius: 40,
            //     child: CircleAvatar(
            //       radius: 35,
            //       backgroundImage: AssetImage('images/coffee.jpeg'),
            //     ),
            //   ),
            //   // Text(
            //   //   '${(countToValue[menu] ?? 0) > 0 ? countToValue[menu] : 0}',
            //   //   style: TextStyle(
            //   //     fontSize: 16.0,
            //   //   ),
            //   // ), //Icon(Icons.favorite_rounded),
            //   selected: (countToValue[menu] ?? 0) > 0 ? true : false,
            //   trailing: Text(
            //     '${(countToValue[menu] ?? 0) > 0 ? countToValue[menu] : 0}',
            //     style: TextStyle(
            //       fontSize: 16.0,
            //     ),
            //   ), //Icon(Icons.favorite_rounded),
            //   // Icon(
            //   //   Icons.add_shopping_cart,
            //   //   color: (countToValue[menu] ?? 0) > 0 ? Colors.red : null,
            //   // ),
            // ),
          ],
        ),
      ),
    );

    Widget buttonSection = Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                countToValue = {};
              });
            },
            child: Icon(
              Icons.rotate_right_sharp,
              semanticLabel: "초기화",
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                countToValue = {};
              });
            },
            child: Icon(
              Icons.subdirectory_arrow_right_rounded,
              semanticLabel: "주문하기",
            ),
          ),
          // _buildButtonColumn(color, Icons.rotate_right_sharp, '초기화'),
          // _buildButtonColumn(
          //     color, Icons.subdirectory_arrow_right_rounded, '주문하기'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   // side: BorderSide(
        //   //   color: Colors.black,
        //   // ),
        // ),
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "Coffee Order Bar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: Icon(Icons.search),
        //   ),
        // ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            // gradient: LinearGradient(
            //   colors: [Colors.red, Colors.pink],
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            // ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  // vertical: 20.0,
                ),
                child: titleSection,
              ),
              // SubTitle
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      // vertical: 20.0,
                    ),
                    child: Text("원하시는 메뉴를 클릭해 주세요."),
                  ),
                ],
              ),
              // Menu List
              SizedBox(
                height: 500,
                child: menuSection,
              ),
              buttonSection,
            ],
          ),
        ),
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

Image image = Image.asset(
  // 'images/lake.jpeg',
  'images/coffee.jpeg',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
);

ListTile _buildMenuList(Map menuList, Map countToValue, String menu) {
  return ListTile(
    // ListTile needs constraints so it knows where its bounds are.
    title: Text(
      '$menu',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    isThreeLine: false,
    subtitle: Text(
      '${menuList[menu]}',
      style: TextStyle(
        fontSize: 13.0,
        color: Colors.grey[350],
        fontWeight: FontWeight.w400,
      ),
    ),
    leading: CircleAvatar(
      backgroundColor: Colors.black,
      radius: 40,
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage('images/coffee.jpeg'),
      ),
    ),
    selected: (countToValue[menu] ?? 0) > 0 ? true : false,
  );
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
    
// ElevatedButton button = ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     primary: Colors.purple,
//     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//     textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//   ),
//   onPressed: () {
//     setState(() {
//       countToValue = {};
//     });
//   },
//   child: Icon(
//     Icons.rotate_right_sharp,
//     semanticLabel: "초기화",
//   ),
// );
