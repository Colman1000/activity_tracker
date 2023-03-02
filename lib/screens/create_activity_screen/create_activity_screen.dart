import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/utils/form_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_activity_controller.dart';

class CreateActivityScreen extends StatelessWidget {
  CreateActivityScreen({super.key}) : controller = CreateActivityController();

  final CreateActivityController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 5,
        primary: true,
        leading: const BackButton(color: AppColors.white),
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Add Activity'),
          centerTitle: true,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Align(
              child: Text(
                'Create your own custom activity',
                style: TextStyle(
                  color: AppColors.grey6,
                  fontSize: 10,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Activity'),
                ),
                initialValue: controller.activity(),
                onChanged: controller.activity,
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
                dropdownMenuEntries: controller.validTypes,
                onSelected: controller.type,
                label: const Text('Type'),
                enableFilter: true,
                enableSearch: true,
                width: controller.menuWidth(context),
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
                initialValue: controller.participants(),
                onChanged: controller.participants,
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
                initialValue: controller.price(),
                onChanged: controller.price,
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
                initialValue: controller.accessibility(),
                onChanged: controller.accessibility,
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
              child: Obx(
                () => TextButton(
                  onPressed: () => controller.createActivity(context),
                  child: controller.isSubmittingActivity()
                      ? const Align(child: CupertinoActivityIndicator())
                      : const Text('Create New Activity'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
