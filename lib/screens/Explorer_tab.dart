import 'package:flight_tickets_deal_app/widgets/currentlySeenItems_widget.dart';
import 'package:flight_tickets_deal_app/widgets/mainSearch_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorerTab extends StatelessWidget {
  final ScrollController _mainScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (_) {
        Provider.of<Animator>(context, listen: false).onScrollActivationBrain(
          scrollController: _mainScrollController,
        );
        return true;
      },
      child: SingleChildScrollView(
        controller: _mainScrollController,
        child: Column(
          children: <Widget>[
            ExplorerScreenSearch(),
            CurrentlyWatchedItems(),
            CurrentlyWatchedItems(),
            CurrentlyWatchedItems(),
          ],
        ),
      ),
    );
  }
}

class Animator extends ChangeNotifier {
  double offset = 0.00;

  void _modifiyOffset(double newOffset) {
    offset = newOffset;
    notifyListeners();
  }

  void onScrollActivationBrain({ScrollController scrollController}) {
    double scrollOffset = scrollController.position.pixels;
    if (scrollOffset > 10 && scrollOffset < 35) {
      _modifiyOffset(2 / 100);
    } else if (scrollOffset > 50 && scrollOffset < 100) {
      _modifiyOffset(3.5 / 100);
    } else if (scrollOffset < 10) {
      _modifiyOffset(0 / 100);
    }
  }
}
