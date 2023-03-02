import 'package:activity_tracker/screens/create_activity_screen/create_activity_screen.dart';
import 'package:activity_tracker/screens/home_screen/home_screen.dart';
import 'package:activity_tracker/screens/view_activity_screen/view_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<CreateActivityRoute>(path: 'activity/new'),
    TypedGoRoute<ViewActivityRoute>(path: 'activity/:id'),
  ],
)
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, state) {
    return HomeScreen();
  }
}

@immutable
class CreateActivityRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, state) {
    return CreateActivityScreen();
  }
}

@immutable
class ViewActivityRoute extends GoRouteData {
  const ViewActivityRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, state) {
    return ViewActivityScreen(activityId: id);
  }
}
