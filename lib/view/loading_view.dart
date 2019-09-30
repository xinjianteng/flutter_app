import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';

Widget getLoading({bool start = true}) {
  return IgnorePointer(
    child: Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: FlareActor(
        '',
        animation: 'start',
        color: GColors.theme_color_dark,
        isPaused: start != true,
      ),
    ),
  );
}
