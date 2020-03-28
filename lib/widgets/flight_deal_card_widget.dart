import 'package:flutter/material.dart';

import '../appTheme.dart';

class FlightDealCard extends StatelessWidget {
  final String newCost;
  final String oldCost;
  final String flightDate;
  final String flightAirlineName;
  final String flightDealRating;
  final String discountAmount;

  const FlightDealCard({
    Key key,
    @required this.width,
    @required this.newCost,
    @required this.oldCost,
    @required this.flightAirlineName,
    @required this.flightDate,
    @required this.flightDealRating,
    @required this.discountAmount,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width - 40,
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.only(top: 20, left: 15, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: '\$' + '$newCost ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '(\$' + '$oldCost)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DealSmallDetails(
                      icon: Icons.calendar_today, title: flightDate),
                  SizedBox(
                    width: 10,
                  ),
                  DealSmallDetails(
                      icon: Icons.flight, title: flightAirlineName),
                  SizedBox(
                    width: 10,
                  ),
                  DealSmallDetails(icon: Icons.star, title: flightDealRating),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 5,
          top: 32,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              discountAmount + '%',
              style: TextStyle(
                  color: Color(0xffff6925),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Color(0xfffff0e9),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DealSmallDetails extends StatelessWidget {
  final IconData icon;
  final String title;
  DealSmallDetails({@required this.icon, @required this.title});
  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(title),
      labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Oxygen',
          fontWeight: FontWeight.w600),
      avatar: Icon(
        icon,
        color: Colors.black,
        size: 15,
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 7),
      backgroundColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
