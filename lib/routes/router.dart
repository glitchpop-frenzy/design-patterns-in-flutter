import 'package:auto_route/auto_route.dart';
import 'package:design_patterns_in_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:design_patterns_in_flutter/01_singleton/singleton_example.dart';
part 'router.gr.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: HomePage,
    initial: true,
  ),
  AutoRoute(
    page: SingletonExample,
  ),
])
class AppRouter extends _$AppRouter {}
