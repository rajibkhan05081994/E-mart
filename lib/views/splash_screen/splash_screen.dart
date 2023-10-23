import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/views/auth_screen/login_screen.dart';
import 'package:e_mart/views/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:e_mart/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=>LoginScreen());
        }else{
          Get.to(()=> const HomeScreen());
        }
      });
    });
  }

  @override
  void initState(){
    changeScreen();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft,
            child: Image.asset(icSplashBg,width: 300)
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
