import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../../../widgets/primary_image_button.dart';

class LoginWithGoogleButton extends ConsumerWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryImageButton(
      isoutline: true,
      color: Colors.white,
      ontap: () async {},
      text: 'Continue with google',
      image: Images.googleIcon,
    );
  }
}
