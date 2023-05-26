import 'package:flutter/material.dart';
import 'package:workposts_mobile/configuration.dart';

class WorkpostPreviewLoadingWidget extends StatefulWidget {
  const WorkpostPreviewLoadingWidget({super.key});

  @override
  State<WorkpostPreviewLoadingWidget> createState() =>
      _WorkpostPreviewLoadingWidgetState();
}

class _WorkpostPreviewLoadingWidgetState
    extends State<WorkpostPreviewLoadingWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        height: 24,
                        width: width * 0.3,
                        color: Configuration.primaryLightColor)),
                const SizedBox(height: 10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 20,
                        width: width * 0.5,
                        color: Configuration.primaryLightColor))
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 20,
                    width: width * 0.1,
                    color: Configuration.primaryLightColor))
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: width * 1.05,
                width: width,
                color: Configuration.primaryLightColor)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 20,
                        width: width * 0.15,
                        color: Configuration.primaryLightColor)),
                const SizedBox(height: 10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 20,
                        width: width * 0.3,
                        color: Configuration.primaryLightColor))
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 40,
                    width: width * 0.3,
                    color: Configuration.primaryLightColor))
          ],
        )
      ],
    );
  }
}
