import 'package:flutter/material.dart';
import 'package:flutter_application_1/bookmarkpage.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:flutter_application_1/topfoodiepage.dart';

class DiscoveryPage extends StatelessWidget {

  final int barIndex;

  const DiscoveryPage({required this.barIndex, super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie's App",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Discover Restaurants Near You",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: const Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Turn On Your Location!'),
              ],
            )
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
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
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