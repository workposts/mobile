import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configuration.dart';

class FilterButtonWidget extends StatefulWidget {
  const FilterButtonWidget({super.key});

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _controller.forward();
      },
      onTapUp: (details) {
        _controller.reverse();
      },
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 300,
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
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.85).animate(_controller),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.06125),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.125,
              height: MediaQuery.of(context).size.width * 0.125,
              decoration: const BoxDecoration(color: Configuration.accentColor),
              child: Center(
                  child: SvgPicture.asset(
                "images/filter.svg",
                color: Configuration.primaryDarkColor,
                height: MediaQuery.of(context).size.width * 0.05,
                width: MediaQuery.of(context).size.width * 0.05,
              ))),
        ),
      ),
    );
  }
}
