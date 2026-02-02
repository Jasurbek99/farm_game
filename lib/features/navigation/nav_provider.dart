import 'package:flutter/foundation.dart';
import 'package:farm_game/features/navigation/nav_tab.dart';

class NavProvider extends ChangeNotifier {
  NavTab _currentTab = NavTab.farm;

  NavTab get currentTab => _currentTab;

  void setTab(NavTab tab) {
    if (_currentTab != tab) {
      _currentTab = tab;
      notifyListeners();
    }
  }
}
