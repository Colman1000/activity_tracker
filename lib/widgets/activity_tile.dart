import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/config/constants.dart';
import 'package:activity_tracker/config/routes/routes.dart';
import 'package:activity_tracker/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile(
    this.activity, {
    super.key,
    this.edited = false,
  });

  final Activity activity;
  final bool edited;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      key: ValueKey(activity.key),
      subtitle: Text(
        '${activity.type.toUpperCase()}  •  ${activity.participants} participant${activity.participants > 2 ? 's' : ''}',
        style: const TextStyle(
          color: AppColors.grey7,
          fontSize: 10,
          letterSpacing: 1.5,
        ),
      ),
      title: Text(activity.activity),
      leading: Hero(
        tag: activity.key,
        child: AnimatedContainer(
          duration: Constants.duration,
          decoration: BoxDecoration(
            color: edited
                ? AppColors.brandSecondary1.withOpacity(0.7)
                : AppColors.brandPrimary10,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.brandPrimary10,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(14),
            child: Icon(
              activity.icon,
              color: AppColors.brandPrimary3,
              size: 14,
            ),
          ),
        ),
      ),
      onTap: () => ViewActivityRoute(id: activity.key).go(context),
    );
  }
}
