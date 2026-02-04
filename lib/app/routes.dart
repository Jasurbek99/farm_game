import 'package:flutter/material.dart';
import 'package:farm_game/features/farm/presentation/screens/chicken_barn_screen.dart';
import 'package:farm_game/features/factory/presentation/screens/cake_factory_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/profile_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/change_password_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/language_screen.dart';
import 'package:farm_game/features/debug/design_gallery_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String farmChicken = '/farm/chicken';
  static const String farmSheep = '/farm/sheep';
  static const String farmCow = '/farm/cow';
  static const String farmPig = '/farm/pig';
  static const String factoryCake = '/factory/cake';
  static const String factoryBbq = '/factory/bbq';
  static const String factoryMeat = '/factory/meat';
  static const String factorySugar = '/factory/sugar';
  static const String factoryDairy = '/factory/dairy';
  static const String factoryBakery = '/factory/bakery';
  static const String factoryIceCream = '/factory/ice_cream';
  static const String factoryWeaving = '/factory/weaving';
  static const String profile = '/profile';
  static const String profileChangePassword = '/profile/change-password';
  static const String profileLanguage = '/profile/language';
  static const String designGallery = '/design-gallery';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      farmChicken: (context) => const ChickenBarnScreen(),
      farmSheep: (context) => const ChickenBarnScreen(),
      farmCow: (context) => const ChickenBarnScreen(),
      farmPig: (context) => const ChickenBarnScreen(),
      factoryCake: (context) => const CakeFactoryScreen(),
      // TODO: Create individual factory screens for each building
      factoryBbq: (context) => const CakeFactoryScreen(),
      factoryMeat: (context) => const CakeFactoryScreen(),
      factorySugar: (context) => const CakeFactoryScreen(),
      factoryDairy: (context) => const CakeFactoryScreen(),
      factoryBakery: (context) => const CakeFactoryScreen(),
      factoryIceCream: (context) => const CakeFactoryScreen(),
      factoryWeaving: (context) => const CakeFactoryScreen(),
      profile: (context) => const ProfileScreen(),
      profileChangePassword: (context) => const ChangePasswordScreen(),
      profileLanguage: (context) => const LanguageScreen(),
      designGallery: (context) => const DesignGalleryScreen(),
    };
  }
}
