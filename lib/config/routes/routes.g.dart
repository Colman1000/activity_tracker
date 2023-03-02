// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeScreenRoute,
    ];

GoRoute get $homeScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'activity/new',
          factory: $CreateActivityRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'activity/:id',
          factory: $ViewActivityRouteExtension._fromState,
        ),
      ],
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $CreateActivityRouteExtension on CreateActivityRoute {
  static CreateActivityRoute _fromState(GoRouterState state) =>
      CreateActivityRoute();

  String get location => GoRouteData.$location(
        '/activity/new',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ViewActivityRouteExtension on ViewActivityRoute {
  static ViewActivityRoute _fromState(GoRouterState state) => ViewActivityRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/activity/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
