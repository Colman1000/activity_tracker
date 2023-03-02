import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/config/constants.dart';
import 'package:activity_tracker/screens/home_screen/home_controller.dart';
import 'package:activity_tracker/widgets/activity_tile.dart';
import 'package:activity_tracker/widgets/activity_type_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_list/implicitly_animated_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leadingWidth: 0,
        elevation: 5,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Activities'),
          centerTitle: true,
        ),
      ),
      body: Obx(
        ()=> Column(
          children: [
            const SizedBox(height: 24),
            SizedBox(
              height: 30,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: controller.types
                        .map((e) => ActivityTypeChip(e, controller.selected()))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            if (controller.isMakingRequest())
              const Expanded(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
            else if (controller.activities.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No Activities Recorded',
                    style: TextStyle(
                      color: AppColors.brandPrimary6,
                      fontSize: 16,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Obx(
                  () => ImplicitlyAnimatedList(
                    itemData: controller.activities,
                    itemBuilder: (context, activity) => Obx(
                      () => ActivityTile(
                        activity,
                        edited:
                            controller.editedActivities.contains(activity.key),
                      ),
                    ),
                    initialAnimation: true,
                    itemEquality: (a, b) => a.key == b.key,
                    deleteDuration: Constants.duration,
                    insertDuration: Constants.duration,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.createActivity(context),
        label: const Text('Add Activity'),
        icon: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
