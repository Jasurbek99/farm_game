import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/widgets/bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? backgroundAsset;
  final Color? backgroundColor;
  final bool showBottomNav;

  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundAsset,
    this.backgroundColor,
    this.showBottomNav = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            if (backgroundAsset != null)
              Positioned.fill(
                child: Image.asset(
                  backgroundAsset!,
                  fit: BoxFit.cover,
                ),
              )
            else if (backgroundColor != null)
              Positioned.fill(
                child: Container(
                  color: backgroundColor,
                ),
              ),
            // Content
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(child: body),
                  if (showBottomNav) const BottomNavBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
