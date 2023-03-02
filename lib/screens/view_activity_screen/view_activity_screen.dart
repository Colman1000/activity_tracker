import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/config/constants.dart';
import 'package:activity_tracker/widgets/info_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'view_activity_controller.dart';

class ViewActivityScreen extends StatelessWidget {
  ViewActivityScreen({super.key, required this.activityId})
      : controller = ViewActivityController(activityId);

  final String activityId;

  final ViewActivityController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            if (controller.activity() != null) ...[
              SliverAppBar(
                backgroundColor: AppColors.white,
                centerTitle: false,
                primary: true,
                stretch: true,
                pinned: true,
                elevation: 5,
                forceElevated: true,
                expandedHeight: 400,
                leading: BackButton(
                  color: AppColors.brandPrimary2,
                  onPressed: context.pop,
                ),
                actions: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: controller.isEdited
                          ? ActionChip(
                              label: const Text(
                                'EDITED',
                                style: TextStyle(
                                  color: AppColors.brandPrimary1,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              avatar: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.brandSecondary10,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit_location_outlined,
                                  color: AppColors.brandPrimary1,
                                  size: 14,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: const BorderSide(
                                color: AppColors.brandPrimary10,
                                width: 1,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              backgroundColor: AppColors.brandSecondary10,
                              onPressed: () {},
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => controller.editActivity(context),
                    icon: const Icon(Icons.edit),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => controller.deleteActivity(context),
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
                  const SizedBox(width: 16),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    controller.activity()!.activity,
                    style: const TextStyle(
                      color: AppColors.brandPrimary2,
                      letterSpacing: 1.2,
                    ),
                  ),
                  titlePadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  background: SizedBox(
                    height: 150,
                    width: 150,
                    child: Center(
                      child: Hero(
                        tag: controller.activity()!.key,
                        child: Obx(
                          () => AnimatedContainer(
                            duration: Constants.duration,
                            decoration: BoxDecoration(
                              color: controller.isEdited
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
                              padding: const EdgeInsets.all(48),
                              child: Icon(
                                controller.activity()!.icon,
                                color: AppColors.brandPrimary3,
                                size: 34,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  expandedTitleScale: 1.2,
                  collapseMode: CollapseMode.parallax,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              SliverToBoxAdapter(
                child: InfoTile(
                  label: 'Type',
                  value: controller.activity()!.type.capitalizeFirst ?? '',
                  icon: controller.activity()!.icon,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: InfoTile(
                  label: 'Participants',
                  value: controller.activity()!.participants.toString(),
                  icon: Icons.people_outline_rounded,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: InfoTile(
                  label: 'Accessibility',
                  value:
                      '${(controller.activity()!.accessibility * 100).toInt()}%',
                  icon: Icons.accessibility,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: InfoTile(
                  label: 'Cost Factor',
                  value: controller.activity()!.isFree
                      ? 'Free'
                      : '${(controller.activity()!.price * 100).toInt()}%',
                  icon: Icons.monetization_on_outlined,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ] else
              const SliverFillRemaining(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
