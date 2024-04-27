import 'package:flutter/material.dart';
import 'package:flutter_application_1/bookmarkpage.dart';
import 'package:flutter_application_1/detailpage.dart';
import 'package:flutter_application_1/discoverypage.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:flutter_application_1/topfoodiepage.dart';
import 'InformationCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

bool home = true;
bool popular = false;
bool deals = false;

class HomePage extends StatelessWidget {
  final List _mostPopular = [
    [
      'lib/images/indonesianFood2.jpg',
      'Rumah Rendang',
      'AB Street - 2',
      'Traditional Indonesian'
    ],
    [
      'lib/images/arabicFood.jpg',
      'Ciken Chicken',
      'DC Street - 1',
      'Rice, Arabic'
    ],
    [
      'lib/images/japaneseFood1.jpg',
      'Itadakimas',
      'BB Street - 5',
      'Traditional Japanese'
    ],
    [
      'lib/images/westernFood2.jpeg',
      'Burger Shack',
      'BG Street - 12',
      'Burger, Western'
    ],
  ];

  final List _mealDeals = [
    [
      'lib/images/koreanFood2.jpg',
      'Snack Korea',
      'K Street - 1',
      'Street Food, Korean'
    ],
    [
      'lib/images/japaneseFood2.jpg',
      'Nippon Food',
      'K Street - 13',
      'Sushi, Japanese'
    ],
    [
      'lib/images/italianFood.jpg',
      'Le Delicious',
      'FD Street - 6',
      'Pasta, Italian'
    ],
    [
      'lib/images/koreanFood1.jpg',
      'KorMeal',
      'K Street - 8',
      'Home Meals, Korean'
    ],
  ];

  final List _caraouselItem = [
    ['lib/images/indonesianFood1.jpg', 'Indonesian Style', '15 Places'],
    ['lib/images/indianFood.jpg', 'Indian Style', '12 Places'],
    ['lib/images/thaiFood.jpg', 'Thai Style', '14 Places'],
  ];

  HomePage({super.key});

  int indexNow = 0;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie's App",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Food Discovery",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search for restaurants...',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                        ),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: List.generate(_caraouselItem.length, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_caraouselItem[index][0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 5),
                                child: Text(
                                  _caraouselItem[index][1],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, bottom: 10),
                                child: Text(
                                  _caraouselItem[index][2],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Row(
                              children: List.generate(3, (i) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        i == index ? Colors.white : Colors.grey,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(8),
                      //   child: ElevatedButton(onPressed: null, child: Text('data')),
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Most Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  pageTitle: "Most Popular",
                                  data: _mostPopular,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _mostPopular.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        imageLink: _mostPopular[index][0],
                        restaurantName: _mostPopular[index][1],
                        restaurantAddress: _mostPopular[index][2],
                        restaurantStyle: _mostPopular[index][3],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(8),
                      //   child: ElevatedButton(onPressed: null, child: Text('data')),
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Meal Deals',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  pageTitle: "Meal Deals",
                                  data: _mealDeals,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _mealDeals.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        imageLink: _mealDeals[index][0],
                        restaurantName: _mealDeals[index][1],
                        restaurantAddress: _mealDeals[index][2],
                        restaurantStyle: _mealDeals[index][3],
                      );
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
          currentIndex: indexNow,
          onTap: (int index) {
            if (index == 1) {
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
