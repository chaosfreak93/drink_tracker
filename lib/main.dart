import 'package:flutter/material.dart';

import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'dart:io' show Platform;

final List<DropdownMenuItem<String>> user = [];

void main() async {
  var db = await mongo.Db.create('mongodb://Luap:2C3oa7n358qc9X7bLu@142.132.214.152:27017/drink_tracker');
  
  await db.open();
  //await db.close();

  runApp(const DrinkTracker());
}

class DrinkTracker extends StatelessWidget {
  const DrinkTracker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drink Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DrinkList(),
    );
  }
}

class DrinkList extends StatefulWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  String oldDropdownValue = 'One';

  void _fetchUser() {

  }

  void _addUser() {

  }

  void _removeUser() {

  }

  void _addDrink() {
    
  }

  @override
  Widget build(BuildContext context) {
    _fetchUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('JGV Dattenberg'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(value: oldDropdownValue, items: user, 
                  onChanged: (String? newDropdownValue) {
                    setState(() {
                      oldDropdownValue = newDropdownValue!;
                    });
                  },
                ),
                IconButton(
                  onPressed: _addUser, 
                  tooltip: 'Add User', 
                  icon: const Icon(Icons.add)
                ),
                IconButton(
                  onPressed: _removeUser, 
                  tooltip: 'Remove User', 
                  icon: const Icon(Icons.remove)
                ),
              ],
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDrink,
        tooltip: 'Add Drink',
        child: const Icon(Icons.local_drink),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
