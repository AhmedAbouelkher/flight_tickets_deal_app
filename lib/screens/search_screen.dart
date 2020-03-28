import 'package:flight_tickets_deal_app/models/clipper.dart';
import 'package:flight_tickets_deal_app/widgets/distinationCitys_widget.dart';
import 'package:flight_tickets_deal_app/widgets/flight_deal_card_widget.dart';
import 'package:flutter/material.dart';
import '../appTheme.dart';

class ExplorerSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().mainSearchColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Search Results',
            style: AppTheme()
                .mainTextStyle
                .copyWith(fontSize: 21, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: height * 0.2),
              child: MainHeader(height: height, width: width),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "Best Deals for Next 6 Months",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlightDealCard(
                  width: width,
                  newCost: '4,159',
                  oldCost: '9,999',
                  discountAmount: '55',
                  flightAirlineName: 'Cathay Pacific',
                  flightDate: 'June 2019',
                  flightDealRating: '4.6',
                ),
                FlightDealCard(
                  width: width,
                  newCost: '5,199',
                  oldCost: '6,999',
                  discountAmount: '15',
                  flightAirlineName: 'American Airlines',
                  flightDate: 'Feb 2019',
                  flightDealRating: '4.3',
                ),
                FlightDealCard(
                  width: width,
                  newCost: '6,599',
                  oldCost: '7,999',
                  discountAmount: '20',
                  flightAirlineName: 'Jet Airways',
                  flightDate: 'Jan 2019',
                  flightDealRating: '4.4',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: -230,
          child: ClipPath(
            clipper: MainContainerClipper(),
            child: Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                color: AppTheme().mainSearchColor,
              ),
            ),
          ),
        ),
        ChoosingCity(height: height, width: width)
      ],
    );
  }
}
