import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workposts_mobile/configuration.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Configuration.primaryDarkColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Configuration.primaryLightColor,
                  ),
                ),
              );
            });
      },
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: const BoxDecoration(color: Configuration.accentColor),
            child: Center(
                child: SvgPicture.asset(
              "images/filter.svg",
              color: Configuration.primaryDarkColor,
              height: MediaQuery.of(context).size.width * 0.04,
              width: MediaQuery.of(context).size.width * 0.04,
            ))),
      ),
    );
  }
}
