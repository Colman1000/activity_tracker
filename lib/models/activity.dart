import 'package:activity_tracker/utils/icons.dart';
import 'package:flutter/material.dart';

class Activity {
  final String key;
  final String type;
  final String activity;
  final int participants;
  final double price;
  final double accessibility;

  Activity({
    required this.key,
    required this.activity,
    required this.type,
    double price = 0,
    double accessibility = 0,
    this.participants = 1,
  })  : price = price.clamp(0, 1),
        accessibility = accessibility.clamp(0, 1);

  factory Activity.fromJSON(Map json) {
    return Activity(
      key: (json['key'] ?? '').toString(),
      activity: (json['activity'] ?? '').toString(),
      type: (json['type'] ?? '').toString(),
      participants: int.tryParse(json['participants'].toString()) ?? 1,
      accessibility: double.tryParse(json['accessibility'].toString()) ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> get toJSON {
    return {
      "key": key,
      "type": type,
      "price": price,
      "activity": activity,
      "participants": participants,
      "accessibility": accessibility,
    };
  }

  Activity copyWith({
    String? key,
    String? type,
    double? price,
    String? activity,
    int? participants,
    double? accessibility,
  }) =>
      Activity(
        key: key ?? this.key,
        activity: activity ?? this.activity,
        type: type ?? this.type,
        price: price ?? this.price,
        participants: participants ?? this.participants,
        accessibility: accessibility ?? this.accessibility,
      );

  static IconData getIconFromString(String icon) =>
      iconsMap[icon.toLowerCase()] ?? Icons.priority_high_outlined;

  IconData get icon => getIconFromString(type);

  bool get isFree => price <= 0;
}
