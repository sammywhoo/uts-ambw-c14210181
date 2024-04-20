import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String imageLink; // Corrected from imageList
  final String restaurantName;
  final String restaurantAddress; // Corrected from restaurantAdress
  final String restaurantStyle;

  const InfoCard({
    required this.imageLink,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantStyle,
    super.key, // Corrected super.key to key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 1.0),
              blurRadius: 10.0,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      restaurantName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      restaurantAddress,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Text(
                      restaurantStyle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
