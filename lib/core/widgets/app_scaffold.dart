import 'package:flutter/material.dart';
import 'package:farm_game/core/widgets/bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? backgroundAsset;
  final Color? backgroundColor;
  final bool showBottomNav;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final EdgeInsets safeAreaMinimum;

  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundAsset,
    this.backgroundColor,
    this.showBottomNav = true,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaMinimum = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        right: safeAreaRight,
        minimum: safeAreaMinimum,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
