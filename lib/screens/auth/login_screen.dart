import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talksy/screens/auth/widgets/login_with_apple_button.dart';
import 'package:talksy/screens/auth/widgets/login_with_google_button.dart';
import 'package:talksy/utils/app_textstyle.dart';
import 'package:talksy/utils/utils.dart';
import 'package:talksy/widgets/primary_button.dart';
import 'package:talksy/widgets/primary_loading_indicator.dart';
import 'package:talksy/widgets/primary_text_field.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';
  static const String routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidePassword = useState<bool>(true);
    final formkey = GlobalObjectKey<FormState>(context);
    final emailConntroller = useTextEditingController();
    final passwordController = useTextEditingController();

    // Animation setup
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    )..forward(); // start sliding immediately

    // Slide from −300 px (off-screen left) to 0
    final offsetAnim = Tween<Offset>(
      begin: const Offset(0, -1.2), // Slide from top
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    return PrimaryLoadingIndicator(
      isLoading: false,
      child: Scaffold(
        appBar: AppBar(title: Text('Log In')),
        body: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: SingleChildScrollView(
            child:
                Column(
                  children: [
                    SlideTransition(
                      position: offsetAnim,
                      child: Image.asset(
                        'assets/images/chat_icon.png',
                        width: 180,
                        height: 180,
                      ),
                    ),
                    24.heightBox,
                    PrimaryTextField(
                      controller: emailConntroller,
                      title: 'Email',
                      hintText: 'Enter your email',
                      validator: Validators.emailValidator,
                    ),
                    PrimaryTextField(
                      obscureText: hidePassword.value,
                      controller: passwordController,
                      title: 'Password',
                      hintText: 'Enter your password',
                      validator: Validators.passwordValidator,
                    ),
                    12.heightBox,
                    PrimaryButton(
                      onTap: () async {
                        // if (formkey.currentState!.validate() != true) return;
                        // final email = emailConntroller.text.toString();
                        // final password = passwordController.text.toString();
                      },
                      text: 'Log In',
                    ),
                    24.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(color: context.adaptive12).expand(),
                        Text('  Or  ', style: AppTextstyle.xsRegular),
                        Divider(color: context.adaptive12).expand(),
                      ],
                    ),
                    24.heightBox,
                    LoginWithGoogleButton(),
                    12.heightBox,
                    LoginWithAppleButton(),
                  ],
                ).p16(),
          ),
        ),
      ),
    );
  }
}
