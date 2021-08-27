import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AngleListViewController extends GetxController {
  late ScrollController? scrollController;
  double? itemExtent;
  double? maxExtent;
  var itemCount = 0.obs;
  int jumpRange = 2;
  late Duration animationDuration;
  double get getMaxScrollExtent =>
      scrollController?.position.maxScrollExtent ?? 1;
  double get offset => scrollController?.offset ?? 1;

  double get getItemExtent => itemExtent ?? 1;

  void setConfig({int range = 2, int animationMilliseconds = 500}) {
    jumpRange = range;
    animationDuration = Duration(milliseconds: animationMilliseconds);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onReady() {
    super.onReady();
    itemExtent = getMaxScrollExtent / itemCount.value * jumpRange;
  }

  void jumpNext() {
    if (offset < getMaxScrollExtent) {
      scrollController?.animateTo(
        offset + getItemExtent,
        curve: Curves.linear,
        duration: animationDuration,
      );
    }
  }

  void jumpPrev() {
    if (offset > 0) {
      scrollController?.animateTo(
        offset - getItemExtent,
        curve: Curves.linear,
        duration: animationDuration,
      );
    }
  }
}
