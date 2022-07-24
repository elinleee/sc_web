// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: MenuBoard(),
    );
  }
}

class MenuBoardState extends State<MenuBoard> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 12.0);

  final _menu = ["ICE 아메리카노", "HOT 아메리카노", "vanila latte", "cafe mocha"];
  final _menuCount = <String, int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sukcheon Cafe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Order List',
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    final menuList = _menu.map((menu) {
      return _buildRow(menu);
    }).toList();

    return ListView(
      children: menuList,
    );
    // return ListView.builder(
    //     padding: const EdgeInsets.all(16.0),
    //     itemBuilder: /*1*/ (context, i) {
    //       if (i.isOdd) return Divider(); /*2*/

    //       final index = i ~/ 2; /*3*/
    //       if (index >= _suggestions.length) {
    //         _suggestions.addAll(generateWordPairs().take(10)); /*4*/
    //       }

    //       final alreadySaved = _saved.contains(_suggestions[index]);
    //       return _buildRow(index, alreadySaved);
    //     });
  }

  Widget _buildRow(String menu) {
    int menuCount = 0;
    if (_menuCount.keys.contains(menu)) menuCount = _menuCount[menu] ?? 0;

    return ListTile(
      title: Text(
        menu.toUpperCase(),
        style: _biggerFont,
      ),
      trailing: Text(menuCount.toString()),
      // Icon(
      //   menuCount > 0 ? Icons.favorite : Icons.favorite_border,
      //   color: menuCount > 0 ? Colors.red : null,
      //   semanticLabel: menuCount > 0 ? 'Remove from ordered' : 'Order',
      // ),
      onTap: () {
        // NEW from here ...
        setState(() {
          if (menuCount < 4) {
            _menuCount[menu] = menuCount + 1;
          } else {
            _menuCount[menu] = 0;
          }
        }); // to here.
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      // Add lines from here...
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ), // ...to here.
    );
  }
}

class MenuBoard extends StatefulWidget {
  @override
  MenuBoardState createState() => MenuBoardState();
}
