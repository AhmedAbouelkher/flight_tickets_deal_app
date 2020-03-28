import 'package:flight_tickets_deal_app/appTheme.dart';
import 'package:flight_tickets_deal_app/models/city_list.dart';
import 'package:flight_tickets_deal_app/models/clipper.dart';
import 'package:flight_tickets_deal_app/screens/Explorer_tab.dart';
import 'package:flight_tickets_deal_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorerScreenSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: MainContainerClipper(),
      child: AnimatedContainer(
        height: screenHieght * (0.51 - Provider.of<Animator>(context).offset),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppTheme().mainColorGradient),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 10,
              color: Colors.black,
            )
          ],
        ),
        child: MaunContainerElemants(),
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}

enum SelectedTap { flights, hotels }

class MaunContainerElemants extends StatelessWidget {
  final SelectedTap selectedTap = SelectedTap.flights;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, color: AppTheme().iconsWhiteColor),
                SizedBox(
                  width: 5,
                ),
                PopupMenuButton(
                  onSelected: (index) {
                    Provider.of<Searching>(context, listen: false)
                        .getFromLocation(CityList().citys[index]);
                  },
                  child: Text(
                    '${Provider.of<Searching>(context).intialDisplayedCity}',
                    style: AppTheme().popUpMenuTextStyle,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  itemBuilder: (context) => <PopupMenuItem<int>>[
                    PopupMenuItem(
                      child: Text(
                        CityList().citys[0],
                        style: AppTheme().mainPopUpMenuTextStyle,
                      ),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text(
                        CityList().citys[1],
                        style: AppTheme().mainPopUpMenuTextStyle,
                      ),
                      value: 1,
                    ),
                  ],
                ),
                SizedBox(
                  width: 1,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppTheme().iconsWhiteColor,
                ),
                Spacer(),
                Icon(
                  Icons.settings,
                  color: AppTheme().iconsWhiteColor,
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Where would\n you want to go?',
              textAlign: TextAlign.center,
              style: AppTheme().mainTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: SearchTextField(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: SearchTap(
                      tapName: 'Flights',
                      isSelected:
                          selectedTap == SelectedTap.flights ? true : false,
                      tapIcon: Icons.flight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SearchTap(
                      tapName: 'Hotels',
                      isSelected:
                          selectedTap == SelectedTap.hotels ? true : false,
                      tapIcon: Icons.hotel,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (newText) {
        Provider.of<Searching>(context, listen: false)
            .searchEneteryField(newText);
      },
      cursorColor: AppTheme().primaryColor,
      decoration: InputDecoration(
        hintText: 'Enter Your Wish Destination',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        suffixIcon: InkWell(
          onTap: () {
            // print(
            //     "from ${Provider.of<Searching>(context, listen: false).fromLocationCity} to ${Provider.of<Searching>(context, listen: false).toLocationCity}");
            // Provider.of<Searching>(context, listen: false).isEmpty
            _textController.text.isEmpty == false
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExplorerSearch();
                      },
                    ),
                  )
                : print("Error: Enter A Text");
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.search,
              color: AppTheme().iconsBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTap extends StatelessWidget {
  final bool isSelected;
  final String tapName;
  final IconData tapIcon;
  SearchTap({this.tapName, this.isSelected = false, this.tapIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: isSelected
          ? BoxDecoration(
              color: Color(0xfffc724f),
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            tapIcon,
            color: AppTheme().iconsWhiteColor,
            size: 18,
          ),
          Text(
            " $tapName",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Searching extends ChangeNotifier {
  List<String> citys = CityList().citys;
  String _toLocationCity;
  String _intialDisplayedCity = CityList().citys[0];
  String _fromLocationCity;

  void searchEneteryField(enteredText) {
    _toLocationCity = enteredText;
    notifyListeners();
  }

  void getFromLocation(String fromLocation) {
    _fromLocationCity = fromLocation;
    _intialDisplayedCity = fromLocation;
    notifyListeners();
  }

  void getEnteredSearch(String enteredSearch) {}

  String get fromLocationCity {
    if (_fromLocationCity == null) {
      return _intialDisplayedCity;
    } else {
      return _fromLocationCity;
    }
  }

  void changeCitysOrder() {
    String temp;
    temp = fromLocationCity;
    getFromLocation(toLocationCity);
    searchEneteryField(temp);
    notifyListeners();
  }

  String get toLocationCity => _toLocationCity;
  String get intialDisplayedCity => _intialDisplayedCity;
}
