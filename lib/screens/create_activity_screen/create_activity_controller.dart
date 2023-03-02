import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/models/activity.dart';
import 'package:activity_tracker/services/activity.service.dart';
import 'package:activity_tracker/utils/helpers.dart';
import 'package:activity_tracker/utils/icons.dart';
import 'package:activity_tracker/utils/safe_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CreateActivityController extends GetxController {
  final type = ''.obs;
  final activity = ''.obs;
  final price = '0'.obs;
  final participants = '1'.obs;
  final accessibility = '0'.obs;

  final isSubmittingActivity = false.obs;

  void createActivity(BuildContext context) async {
    if (isSubmittingActivity.value) return;
    if (formKey.currentState?.validate() != true) return;

    isSubmittingActivity.value = true;

    SafeRequest.run(
      () async {
        // Sort the activity keys so the last one is effectively the largest
        final keys = _activityService
            .activities()
            .map((e) => int.tryParse(e.key) ?? 0)
            .toList(growable: false)
          ..sort();

        final newKey = keys.isEmpty ? 1 : keys.last + 1;

        final act = Activity(
          key: newKey.toString(),
          activity: activity(),
          type: type(),
          participants: int.tryParse(participants()) ?? 0,
          price: (double.tryParse(price()) ?? 0) / 100,
          accessibility: (double.tryParse(accessibility()) ?? 0) / 100,
        );

        await _activityService.addActivity(act);
        _reset();
        isSubmittingActivity.value = true;
        context.pop();
      },
      onError: Helpers.showErrorFromAppException,
      onFinally: () => isSubmittingActivity.value = false,
    );
  }

  final formKey = GlobalKey<FormState>();

  double menuWidth(BuildContext context) =>
      MediaQuery.of(context).size.width - 48;

  List<DropdownMenuEntry<String>> get validTypes => iconsMap.entries
      .map(
        (e) => DropdownMenuEntry<String>(
          value: e.key,
          label: e.key.toUpperCase(),
          trailingIcon: Container(
            decoration: const BoxDecoration(
              color: AppColors.brandPrimary10,
              shape: BoxShape.circle,
            ),
            child: Icon(
              e.value,
              color: AppColors.brandPrimary3,
            ),
          ),
        ),
      )
      .toList()
    ..sort(
      (a, b) => a.value.compareTo(b.value),
    );

  void _reset() {
    type.value = '';
    price.value = '';
    activity.value = iconsMap.entries.first.key;
    participants.value = '';
    accessibility.value = '';
  }

  final _activityService = ActivityService.instance;
}
