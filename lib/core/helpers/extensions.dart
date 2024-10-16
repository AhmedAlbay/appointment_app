import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName,
      {Object? argument, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }
   void pop() =>Navigator.of(this).pop();
}
extension StringExtension on String?{

bool isNullorEmpty() => this ==null ||this =="";

} 
extension ListExtension<T> on List<T>?{

bool isNullorEmpty() => this ==null ||this!.isEmpty;

} 