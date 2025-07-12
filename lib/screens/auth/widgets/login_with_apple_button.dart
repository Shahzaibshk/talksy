import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../../../widgets/primary_image_button.dart';

class LoginWithAppleButton extends HookConsumerWidget {
  const LoginWithAppleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (defaultTargetPlatform != TargetPlatform.iOS) return SizedBox();

    return PrimaryImageButton(
      color: Colors.black,
      ontap: () async {},
      text: 'Continue with Apple',
      image: Images.appleIcon,
      textcolor: Colors.white,
    );
  }
}
