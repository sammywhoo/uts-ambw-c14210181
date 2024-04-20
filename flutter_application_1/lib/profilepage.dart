import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bookmarkpage.dart';
import 'package:flutter_application_1/discoverypage.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/topfoodiepage.dart';

class ProfilePage extends StatelessWidget {

  final int barIndex;

  const ProfilePage({required this.barIndex, super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie's App",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Profile Information",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.person, size: min(100, 100),),
                ),
                const Text('Username : Samuel Huang', style: TextStyle(fontSize: 30),),
                const Text('Account ID : C14210181', style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.orange,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: "Discovery",
              icon: Icon(Icons.location_on_outlined),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark_border),
            ),
            BottomNavigationBarItem(
              label: "Top Foodie",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_outline),
            ),
          ],
          currentIndex: barIndex,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                  ),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiscoveryPage(
                    barIndex: index,
                  ),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkPage(
                    barIndex: index,
                  ),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopFoodiePage(
                    barIndex: index,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}