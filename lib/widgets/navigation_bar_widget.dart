import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workposts_mobile/configuration.dart';
import 'package:workposts_mobile/models/page_type.dart';

class NavigationBarWidget extends StatelessWidget {
  final PageType pageType;
  const NavigationBarWidget({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
          color: Configuration.primaryDarkColor,
          border: Border(
              top: BorderSide(color: Configuration.accentColor, width: 1))),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _getIcons(),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getIcons() {
    List<Widget> icons = [];
    var exploreIcon = GestureDetector(
      child: SvgPicture.asset(
        "images/magnifying-glass.svg",
        color: pageType == PageType.explore
            ? Configuration.accentColor
            : Configuration.tertiaryDarkColor,
        height: 25,
        width: 25,
      ),
      onTap: () => {},
    );
    var manageIcon = GestureDetector(
      child: SvgPicture.asset(
        "images/workpost-icon.svg",
        color: pageType == PageType.manage
            ? Configuration.accentColor
            : Configuration.tertiaryDarkColor,
        height: 35,
        width: 35,
      ),
      onTap: () => {},
    );
    var profileIcon = GestureDetector(
      child: SvgPicture.asset(
        "images/account.svg",
        color: pageType == PageType.profile
            ? Configuration.accentColor
            : Configuration.tertiaryDarkColor,
        height: 30,
        width: 30,
      ),
      onTap: () => {},
    );

    icons.add(exploreIcon);
    icons.add(manageIcon);
    icons.add(profileIcon);
    return icons;
  }
}
