import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:talksy/screens/auth/login_screen.dart';
import 'package:talksy/utils/app_textstyle.dart';
import 'package:talksy/utils/utils.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';
  static const String routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context) {
    // Animation setup
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    )..forward(); // start sliding immediately

    // Slide from −300 px (off-screen left) to 0
    final offsetAnim = Tween<Offset>(
      begin: const Offset(-1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    // When the animation finishes, push Home
    useEffect(() {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.goNamed(LoginScreen.routeName);
        }
      });
      return null;
    }, [controller]);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: offsetAnim,
            child: Image.asset(
              'assets/images/chat_icon.png',
              width: 180,
              height: 180,
            ),
          ),
          Text(
            'Talksy',
            style: AppTextstyle.lgBold.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ).centered(),
        ],
      ),
    );
  }
}
