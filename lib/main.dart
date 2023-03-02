import 'package:activity_tracker/app.dart';
import 'package:activity_tracker/services/activity.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/request.service.dart';

void main() {
  Get.put(RequestService());
  Get.put(ActivityService());

  runApp(const App());
}
