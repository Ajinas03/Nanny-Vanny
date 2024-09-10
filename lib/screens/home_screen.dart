import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/screens/home_widgets/main_screen.dart';
import 'package:nanny_vanny/screens/home_widgets/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreenScale: 0.1,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      angle: 0,
      showShadow: true,
      boxShadow: [
        BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(-6, 30)),
      ],
      menuBackgroundColor: ColorConfig.primaryBgColor,
      duration: const Duration(milliseconds: 600),
    );
  }
}
