import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Pedro/AndroidStudioProjects/platzi_trips_app/lib/User/ui/screens/user_trips.dart';
import 'file:///C:/Users/Pedro/AndroidStudioProjects/platzi_trips_app/lib/Place/ui/screens/search_trips.dart';

import 'Place/ui/screens/home_trips.dart'; //diseño estilo ios

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomeTrips(),
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => SearchTrips(),
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => ProfileTrips(),
                );
                break;

            }
          },
          tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.indigo),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.indigo),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.indigo),
                    title: Text("")
                ),
              ]
          ),
        )
    );
  }
}