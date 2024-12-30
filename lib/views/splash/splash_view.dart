
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
      child: Center(child: Column(

        children: [
          LoadingWidget(),
          RoundButton(title: "Login", onClick: (){}),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, RouteName.internetExceptionScreen);
          }, child: Text("Click Here")),

        ],
      ),),
    ),);
  }
}
