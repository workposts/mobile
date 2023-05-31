import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workposts_mobile/bloc/app_bloc.dart';
import 'package:workposts_mobile/bloc/app_event.dart';
import 'package:workposts_mobile/bloc/app_state.dart';
import 'package:workposts_mobile/configuration.dart';
import 'package:workposts_mobile/models/page_type.dart';

class NavigationBarWidget extends StatelessWidget {
  final PageType pageType;
  const NavigationBarWidget({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
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
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        "images/magnifying-glass.svg",
                        color: pageType == PageType.explore
                            ? Configuration.accentColor
                            : Configuration.tertiaryDarkColor,
                        height: 25,
                        width: 25,
                      ),
                      onTap: () => {
                        context.read<AppBloc>().add(
                            const ChangePageEvent(newPage: PageType.explore))
                      },
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        "images/workpost-icon.svg",
                        color: pageType == PageType.manage
                            ? Configuration.accentColor
                            : Configuration.tertiaryDarkColor,
                        height: 35,
                        width: 35,
                      ),
                      onTap: () => {
                        context.read<AppBloc>().add(
                            const ChangePageEvent(newPage: PageType.manage))
                      },
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        "images/account.svg",
                        color: pageType == PageType.profile
                            ? Configuration.accentColor
                            : Configuration.tertiaryDarkColor,
                        height: 30,
                        width: 30,
                      ),
                      onTap: () => {
                        context.read<AppBloc>().add(
                            const ChangePageEvent(newPage: PageType.profile))
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
