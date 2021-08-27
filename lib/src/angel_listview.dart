import 'package:angle_horizontal_listview/src/angle_listview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AngleListView extends StatelessWidget {
  final Widget Function(int index) builder;
  final int itemCount;
  final int jumpRange;
  final List<Icon>? icons;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final bool addAutomaticKeepAlives;
  final int animationMilliseconds;

  const AngleListView(
      {Key? key,
      required this.builder,
      required this.itemCount,
      this.icons,
      this.physics,
      this.padding = EdgeInsets.zero,
      this.addAutomaticKeepAlives = true,
      this.animationMilliseconds = 500,
      this.jumpRange = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angleController = AngleListViewController();

    return GetBuilder<AngleListViewController>(
      init: angleController,
      initState: (_) {
        angleController.setConfig(
            range: jumpRange, animationMilliseconds: animationMilliseconds);
        angleController.itemCount.value = itemCount;
      },
      builder: (controller) => buildListView(controller),
    );
  }

  Widget buildListView(AngleListViewController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: icons?.first ?? Icon(Icons.arrow_back_ios_rounded),
            onPressed: controller.jumpPrev),
        Expanded(
          child: Center(
            child: ListView.builder(
              itemCount: itemCount,
              addAutomaticKeepAlives: addAutomaticKeepAlives,
              padding: padding,
              controller: controller.scrollController,
              physics: physics ?? BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Center(child: builder(index));
              },
            ),
          ),
        ),
        IconButton(
          icon: icons?.last ?? Icon(Icons.arrow_forward_ios_rounded),
          onPressed: controller.jumpNext,
        ),
      ],
    );
  }
}
