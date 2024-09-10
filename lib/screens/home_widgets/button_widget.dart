import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool? isPink;
  final bool? isCyan;
  final String? svgPath;
  const ButtonWidget(
      {super.key, required this.title, this.isPink, this.isCyan, this.svgPath});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (svgPath?.isNotEmpty ?? false) ? 28 : 25,
      child: FloatingActionButton.extended(
        backgroundColor: (isCyan ?? false)
            ? ColorConfig.cyan
            : (isPink ?? false)
                ? ColorConfig.darkPink
                : ColorConfig.darkBlue,
        elevation: 0,
        onPressed: () {},
        label: Row(
          children: [
            (svgPath?.isNotEmpty ?? false)
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: svgPath == AssetConfig.loaction
                        ? Icon(
                            Icons.location_on_outlined,
                            color: ColorConfig.primaryBgColor,
                            size: 12,
                          )
                        : SvgPicture.asset(svgPath ?? ""),
                  )
                : const SizedBox(),
            TextWidget(
                text: title, size: 12, color: ColorConfig.primaryBgColor),
          ],
        ),
      ),
    );
  }
}
