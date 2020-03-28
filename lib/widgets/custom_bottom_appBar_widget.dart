import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flight_tickets_deal_app/appTheme.dart';
import 'package:flutter/material.dart';

class CustomAppBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

  CustomAppBottomBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: AppTheme().primaryColor,
        ),
        title: Text(
          "Explore",
          style: bottomNavigationBarItemStyle.copyWith(
              color: AppTheme().primaryColor),
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Watchlist",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          print("index $index");
        },
      ),
    );
  }
}

class ConvexAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: AppTheme().iconsWhiteColor,
      color: AppTheme().iconsBlackColor,
      activeColor: AppTheme().iconsBlackColor,
      elevation: 8,
      height: 50,
      curve: Curves.ease,
//      top: -15,
      style: TabStyle.flip,
      items: [
        TabItem(icon: Icons.home, title: 'Explore'),
        TabItem(icon: Icons.favorite, title: 'Wishlist'),
        TabItem(icon: Icons.local_offer, title: 'Deals'),
        TabItem(icon: Icons.notifications, title: 'Notifications'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      onTap: (int i) {
        print('click index=$i');
      },
    );
  }
}

class CustomMadeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          // text: 'Explorer',
        ),
        Tab(
          icon: Icon(
            Icons.favorite,
          ),
          // text: 'Watchlist',
        ),
        Tab(
          icon: Icon(
            Icons.local_offer,
          ),
          // text: 'Deals',
        ),
        Tab(
          icon: Icon(
            Icons.notifications,
          ),
          // text: 'Notifications',
        ),
      ],
      indicatorColor: AppTheme().primaryColor,
      labelColor: Colors.grey,
      indicatorPadding: EdgeInsets.only(bottom: 40),
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.grey,
    );
  }
}
