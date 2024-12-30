
part of 'splash_imports.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashService = SplashService();
  @override
  void initState() {
    splashService.isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: SafeArea(
      child: Center(child: Text("Splash Screen"),),
    ),);
  }
}
