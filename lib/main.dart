import 'package:flight_tickets_deal_app/screens/Explorer_tab.dart';
import 'package:flight_tickets_deal_app/widgets/mainSearch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flight_tickets_deal_app/widgets/custom_bottom_appBar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Animator()),
        ChangeNotifierProvider(create: (context) => Searching()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        bottomNavigationBar: CustomMadeTabBar(),
        body: TabBarView(
          children: [
            ExplorerTab(),
            Container(color: Colors.green),
            Container(color: Colors.blue),
            Container(color: Colors.orange),
          ],
        ),
      ),
      length: 4,
    );
  }
}
