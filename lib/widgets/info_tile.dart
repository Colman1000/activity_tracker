import 'package:activity_tracker/config/colors.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.label,
    required this.value,
    this.icon = Icons.star,
    super.key,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColors.brandPrimary5,
                fill: 0.3,
                size: 10,
              ),
              Align(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.brandPrimary1,
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.brandPrimary5,
                    fontSize: 8,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
