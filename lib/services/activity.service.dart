import 'package:activity_tracker/models/activity.dart';
import 'package:activity_tracker/models/app_exception.dart';
import 'package:activity_tracker/services/request.service.dart';
import 'package:activity_tracker/utils/extensions/iterable.dart';
import 'package:activity_tracker/utils/helpers.dart';
import 'package:activity_tracker/utils/safe_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityService extends GetxService {
  static ActivityService get instance => Get.find<ActivityService>();

  final listKey = GlobalKey<SliverAnimatedListState>();

  final RxList<Activity> activities = RxList<Activity>();

  final RxList<String> selected = RxList([]);
  final RxList<String> edited = RxList([]);

  final isMakingRequest = false.obs;

  void selectActivityType(String t) {
    if (selected.contains(t)) {
      selected.remove(t);
      return;
    }
    selected.add(t);
  }

  Activity? findActivity(String id) {
    final found = activities().where((e) => e.key == id);
    if (found.isEmpty) return null;

    return found.first;
  }

  Future<void> addActivity(Activity userActivity) async {
    final response =
        await _reqService.client.post('suggestion', data: userActivity.toJSON);

    if ((response.statusCode ?? 300) > 299) {
      throw AppException(
        response.statusMessage ?? 'An unexpected error occurred',
      );
    }

    activities.insert(0, userActivity);
  }

  void deleteActivity(Activity selectedActivity) {
    activities.removeWhere((a) => a.key == selectedActivity.key);
    edited.removeWhere((a) => a == selectedActivity.key);
  }

  @override
  void onInit() async {
    super.onInit();
    SafeRequest.run(
      () async {
        isMakingRequest.value = true;
        final a = await Future.wait(List.generate(20, _fetchRandomActivity));
        List<Activity> filtered =
            _filterEmpty(a).filterBy((e) => e.key).toList();
        activities.value = filtered;
      },
      onFinally: () => isMakingRequest.value = false,
      onError: Helpers.showErrorFromAppException,
    );
  }

  Future<Activity?> _fetchRandomActivity([int? _]) async {
    final client = RequestService.instance.client;
    return SafeRequest.run<Activity>(
      () async {
        final res = await client.get('activity');
        return Activity.fromJSON(res.data);
      },
      onError: _rethrow,
      defaultValue: null,
    );
  }

  List<Activity> _filterEmpty(List<Activity?> nullableActivities) {
    return [
      for (final a in nullableActivities)
        if (a != null) a
    ];
  }

  AppException _rethrow(AppException e) {
    throw e;
  }

  final _reqService = RequestService.instance;
}
