import 'package:flutter/material.dart';

import 'constColor.dart';


class SampleWidget{
  static Widget builbes(
      {required double top,
      required double bottom,
      required double left,
      required double right}) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: AppColors.bg,
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 0.8, spreadRadius: 0.0)
            ]),
      ),
    );
  }

  static Widget radiusButtons(
      {required Icon icon, required VoidCallback ontapAction}) {
    return InkWell(
      onTap: ontapAction,
      child: Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
        child: icon,
      ),
    );
  }  
}