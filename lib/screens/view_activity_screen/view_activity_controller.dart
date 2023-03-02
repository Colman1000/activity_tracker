import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/models/activity.dart';
import 'package:activity_tracker/services/activity.service.dart';
import 'package:activity_tracker/utils/form_validators.dart';
import 'package:activity_tracker/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ViewActivityController extends GetxController {
  ViewActivityController(this.id) {
    activity.value = _activityService.findActivity(id);
  }

  final String id;

  final activity = Rx<Activity?>(null);

  RxList<String> get editedActivities => _activityService.edited;

  bool get isEdited =>
      activity() == null ? false : (editedActivities.contains(activity()!.key));

  void updateActivityEntry(Activity? a) {
    if (a == null) return;
    activity.value = a;
  }

  void deleteActivity(BuildContext context) async {
    final selectedActivity = activity();

    if (selectedActivity == null) return;

    final canProceed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this Activity?'),
          actions: [
            TextButton(
              onPressed: context.pop,
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              onPressed: () => context.pop(true),
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );

    if (canProceed != true) return;

    _activityService.deleteActivity(selectedActivity);
    return context.pop();
  }

  void saveActivityEdit(BuildContext context) async {
    final selectedActivity = activity();
    if (selectedActivity == null) return;

    final itemIndex = _activityService.activities
        .indexWhere((a) => a.key == selectedActivity.key);
    if (itemIndex < 0) return;
    _activityService.activities[itemIndex] = selectedActivity;
    _activityService.edited.add(selectedActivity.key);
    context.pop();
  }

  void editActivity(BuildContext context) async {
    showModalBottomSheet<Activity?>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Card(
            child: ListView(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Activity'),
                    ),
                    initialValue: activity()?.activity,
                    onChanged: (v) => updateActivityEntry(
                      activity()?.copyWith(activity: v),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidators.required,
                    minLines: 3,
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: DropdownMenu<String>(
                    dropdownMenuEntries: validTypes,
                    onSelected: (v) => updateActivityEntry(
                      activity()?.copyWith(type: v),
                    ),
                    initialSelection: activity()?.type,
                    label: const Text('Type'),
                    enableFilter: true,
                    enableSearch: true,
                    width: menuWidth(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Participants'),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidators.ensureNumeric,
                    initialValue: activity()?.participants.toString(),
                    onChanged: (v) => updateActivityEntry(
                      activity()?.copyWith(participants: int.tryParse(v) ?? 0),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Price Factor'),
                      suffix: Text('%'),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidators.ensureNumeric,
                    initialValue:
                        ((activity()?.price ?? 0) * 100).toInt().toString(),
                    onChanged: (v) => updateActivityEntry(
                      activity()
                          ?.copyWith(price: (double.tryParse(v) ?? 0) / 100),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Accessibility'),
                      suffix: Text('%'),
                    ),
                    initialValue: ((activity()?.accessibility ?? 0) * 100)
                        .toInt()
                        .toString(),
                    onChanged: (v) => updateActivityEntry(
                      activity()?.copyWith(
                          accessibility: (double.tryParse(v) ?? 0) / 100),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidators.ensureNumeric,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: TextButton(
                    onPressed: () => saveActivityEdit(context),
                    child: const Text('Update Activity'),
                  ),
                ),
                const SizedBox(
                  height: kToolbarHeight,
                ),
              ],
            ),
          ),
        );
      },
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

  final _activityService = ActivityService.instance;
}
