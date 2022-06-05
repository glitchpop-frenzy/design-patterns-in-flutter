// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SingletonExampleRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SingletonExample());
    },
    AwesomeAdapterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AwesomeAdapter());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/'),
        RouteConfig(SingletonExampleRoute.name, path: '/singleton-example'),
        RouteConfig(AwesomeAdapterRoute.name, path: '/awesome-adapter')
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [SingletonExample]
class SingletonExampleRoute extends PageRouteInfo<void> {
  const SingletonExampleRoute()
      : super(SingletonExampleRoute.name, path: '/singleton-example');

  static const String name = 'SingletonExampleRoute';
}

/// generated route for
/// [AwesomeAdapter]
class AwesomeAdapterRoute extends PageRouteInfo<void> {
  const AwesomeAdapterRoute()
      : super(AwesomeAdapterRoute.name, path: '/awesome-adapter');

  static const String name = 'AwesomeAdapterRoute';
}
