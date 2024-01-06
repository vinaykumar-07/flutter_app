import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/Cricket.dart';
import 'package:flutter_app/src/pages/basketball.dart';
import 'package:flutter_app/src/pages/football.dart';
import 'package:flutter_app/src/pages/tennis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  //list of pages
  List pages = [
    const CricketPage(),     //cricket info page 
    const FootballPage(),    //football info page
    const TennisPage(),      //tennis info page 
    const BasketBallPage(),  //basketball info page
  ];

  //On tap Navigation function
  void onTapNav(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[selectedIndex],
      //bottomNavigation bar
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTapNav,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket),
              label: "Cricket",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded), label: "FootBall"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_tennis), label: "Tennis"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball), label: "Basketball")
          ]),
    );
  }
}
