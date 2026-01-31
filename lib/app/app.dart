import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farm_game/app/routes.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_theme.dart';
import 'package:farm_game/features/navigation/nav_provider.dart';
import 'package:farm_game/features/navigation/nav_tab.dart';
import 'package:farm_game/features/farm/presentation/screens/farm_main_screen.dart';
import 'package:farm_game/features/factory/presentation/screens/factory_main_screen.dart';
import 'package:farm_game/features/store/presentation/screens/store_screen.dart';
import 'package:farm_game/features/friends/presentation/screens/friends_screen.dart';

class FarmGameApp extends StatelessWidget {
  const FarmGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavProvider(),
      child: MaterialApp(
        title: AppStrings.appName,
        theme: AppTheme.light(),
        home: const MainScreen(),
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, navProvider, child) {
        switch (navProvider.currentTab) {
          case NavTab.farm:
            return const FarmMainScreen();
          case NavTab.factory:
            return const FactoryMainScreen();
          case NavTab.store:
            return const StoreScreen();
          case NavTab.friends:
            return const FriendsScreen();
        }
      },
    );
  }
}
