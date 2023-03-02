import 'package:activity_tracker/config/routes/routes.dart';
import 'package:activity_tracker/models/activity.dart';
import 'package:activity_tracker/services/activity.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Activity> get _activities => _activityService.activities;

  List<Activity> get activities {
    if (selected().isEmpty) return _activities();
    return _activities().where((e) => selected.contains(e.type)).toList();
  }

  RxBool get isMakingRequest => _activityService.isMakingRequest;

  RxList<String> get selected => _activityService.selected;

  RxList<String> get editedActivities => _activityService.edited;

  List<String> get types =>
      _activities().map((e) => e.type).toSet().toList()..sort();

  void createActivity(BuildContext context) {
    CreateActivityRoute().go(context);
  }

  final _activityService = ActivityService.instance;
}
