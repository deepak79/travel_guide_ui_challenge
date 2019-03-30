import 'package:flutter/material.dart';
import 'package:travel_guide/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{'/details': (context) => Detail()},
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            title: Container(),
            icon: SizedBox(
              height: 60,
              child: ListTile(
                title: Icon(
                  Icons.brightness_1,
                  size: 7,
                  color: Colors.black,
                ),
                subtitle: Icon(Icons.explore),
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: SizedBox(
              height: 60,
              child: ListTile(
                subtitle: Icon(Icons.location_on),
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: SizedBox(
              height: 60,
              child: ListTile(
                subtitle: Icon(Icons.supervised_user_circle),
              ),
            ),
          ),
        ],
        currentIndex: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Material(
                elevation: 10.0,
                child: TextFormField(
                  decoration: InputDecoration(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0.0,
                            style: BorderStyle.none),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      filled: false,
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: 'Umba'),
                      hintText: 'Where do you want to go?',
                      fillColor: Colors.white70),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    Text(
                      'DESTINATIONS',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Umba',
                          letterSpacing: 1.4),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Icon(Icons.filter_list)
                  ],
                ),
                height: 50,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 300,
                        child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return Detail();
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: index % 2 == 0
                                      ? Image.asset('assets/images/lake.jpeg')
                                      : Image.asset(
                                          'assets/images/mountain.jpg'),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(
                                        top: 25, left: 20, right: 10),
                                    title: Text(
                                      'San Francisco',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontFamily: 'Umba',
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      'Grab your coat and a handful of flitter, and enter the land of fod and fabulousness.',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Umba',
                                          letterSpacing: 0.5,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Explore',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Umba',
                                              letterSpacing: 1.4,
                                              color: Colors.grey[800]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.arrow_forward,
                                            size: 18, color: Colors.grey[800])
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
