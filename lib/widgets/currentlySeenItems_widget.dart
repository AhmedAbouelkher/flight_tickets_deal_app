import 'package:flutter/material.dart';

class CurrentlyWatchedItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 330,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Currently Watched Items',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All (12)'.toUpperCase(),
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
          ),
          Container(
            height: 280,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CityCard(
                  imagePath: "assets/images/lasvegas.jpg",
                  cityName: 'Las Vegas',
                  discount: 45,
                ),
                CityCard(
                  imagePath: "assets/images/sydney.jpeg",
                  cityName: 'Sydney',
                  discount: 56,
                ),
                CityCard(
                  imagePath: "assets/images/athens.jpg",
                  cityName: 'Athens',
                  discount: 39,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;
  final int discount;
  CityCard({this.cityName, this.discount, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Container(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: 200,
                      height: 80,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black12,
                              Colors.black.withOpacity(0.6)
                            ])),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      bottom: 20,
                      right: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cityName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Feb 26 2019",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              '$discount%',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$2,550 ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  ' (\$4,299)',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
