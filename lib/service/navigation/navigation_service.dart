import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  navigateReplace(Widget widget) {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  Future<void> showDialog(/*BuildContext? context,*/ widget) async {
    await showAdaptiveDialog(
        context: /*context ??*/ navigatorKey.currentContext!,
        builder: (context) => widget);
  }

  void showSnackBar(String message) {
    final context = navigatorKey.currentContext;
    ScaffoldMessenger.of(context!).hideCurrentMaterialBanner();
    final snackBarWidget = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBarWidget);
  }
}
