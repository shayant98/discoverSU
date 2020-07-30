// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/place/place_view.dart';

class Routes {
  static const String homeView = '/';
  static const String placeView = '/place-view';
  static const all = <String>{
    homeView,
    placeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.placeView, page: PlaceView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    PlaceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlaceView(),
        settings: data,
      );
    },
  };
}
