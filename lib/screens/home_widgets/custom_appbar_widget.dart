import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: ColorConfig.primaryBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                ZoomDrawer.of(context)!.toggle();
              },
              icon: SvgPicture.asset(AssetConfig.menu)),
        ],
      ),
    );
  }
}
