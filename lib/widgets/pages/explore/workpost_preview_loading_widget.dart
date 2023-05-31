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
  late AnimationController _controller;
  late Animation<Color?> animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(
      begin: Colors.grey,
      end: Configuration.primaryLightColor,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                        color: animation.value)),
                const SizedBox(height: 10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 20, width: width * 0.5, color: animation.value))
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 20, width: width * 0.1, color: animation.value))
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: width * 1.05, width: width, color: animation.value)),
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
                        color: animation.value)),
                const SizedBox(height: 10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 20, width: width * 0.3, color: animation.value))
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 40, width: width * 0.3, color: animation.value))
          ],
        )
      ],
    );
  }
}
