import 'package:flutter/material.dart';
import 'InformationBox.dart';
import 'homepage.dart';

class DetailPage extends StatelessWidget {

  final String pageTitle;
  final List data;

  DetailPage({required this.pageTitle, required this.data, super.key});

  int indexNow = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie's App",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },),
          title: Center(
            child: Text(
              pageTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: data.length * 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InfoBox(imageLink: data[index][0], restaurantName: data[index][1], 
                      restaurantAddress: data[index][2], restaurantStyle: data[index][3],);
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
          //menunjukkan ada di posisi menu mana (biru-biru)
          onTap: (int index) {
            
          },
        ),
      ),
    );
  }
}

