import 'dart:collection';

class CityList {
  List<String> _citys = ['Boston (BOS)', 'New York City (JFK)'];

  UnmodifiableListView<String> get citys {
    return UnmodifiableListView(_citys);
  }
}
