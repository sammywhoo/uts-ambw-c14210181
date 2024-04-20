import 'package:flutter/material.dart';
import 'package:flutter_application_1/discoverypage.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:flutter_application_1/topfoodiepage.dart';
import 'InformationBox.dart';

class BookmarkPage extends StatelessWidget {

  final int barIndex;
  final List _bookmark = [
    ['lib/images/indonesianFood3.jpg', 'Rasa Indonesia', 'RT Street - 9', 'Pan Fried, Indonesian'],
    ['lib/images/cakes.jpg', 'Cake Factory', 'DD Street - 4', 'Desserts, Cakes'],
    ];

  BookmarkPage({required this.barIndex, super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie's App",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Your Personal Favourites",
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
                  height: _bookmark.length * 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _bookmark.length,
                    itemBuilder: (context, index) {
                      return InfoBox(imageLink: _bookmark[index][0], restaurantName: _bookmark[index][1], 
                      restaurantAddress: _bookmark[index][2], restaurantStyle: _bookmark[index][3],);
                    },
                  ),
                ),
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