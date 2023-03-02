import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/models/activity.dart';
import 'package:activity_tracker/services/activity.service.dart';
import 'package:flutter/material.dart';

class ActivityTypeChip extends StatelessWidget {
  const ActivityTypeChip(
    this.activity, [
    this.selected = const [],
    Key? key,
  ]) : super(key: key);

  final String activity;
  final List<String> selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ActionChip(
        key: ValueKey(activity),
        label: Text(
          activity.toUpperCase(),
          style: const TextStyle(
            color: AppColors.grey7,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
        avatar: Container(
          decoration: const BoxDecoration(
            color: AppColors.brandPrimary10,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Activity.getIconFromString(activity),
            color: AppColors.brandPrimary3,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: const BorderSide(
          color: AppColors.brandPrimary10,
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        backgroundColor:
            selected.contains(activity) ? AppColors.brandPrimary10 : null,
        onPressed: () => ActivityService.instance.selectActivityType(activity),
      ),
    );
  }
}
