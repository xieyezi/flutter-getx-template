import 'package:flutter/material.dart';

/// 设备屏幕高度
double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// 设备屏幕宽度
double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 设备顶部状态栏宽度
double getDeviceTopHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

/// 设备底部Bar宽度
double getDeviceBottomHeight(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}
