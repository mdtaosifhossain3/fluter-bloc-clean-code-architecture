part of 'routes_imports.dart';

class Routes {
  Routes._();
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteName.internetExceptionScreen:
        return MaterialPageRoute(
            builder: (context) => InternetExceptionWidget());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("404 Page Not Found"),
                  ),
                ));
    }
  }
}
