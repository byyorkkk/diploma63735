import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends HookWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final signUpRecognizer = useMemoized(
      () => TapGestureRecognizer()
        ..onTap = () {
          GoRouter.of(context).push(RegisterRoute<void>().location);
        },
    );

    return ADScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const ADText(
              'Let’s you in',
              style: ADTextStyle.h1,
            ),
            const Spacer(
              flex: 3,
            ),
            ADPrimaryButton(
              label: 'Sign in with password',
              onPressed: () {
                GoRouter.of(context).push(LogInRoute<void>().location);
              },
            ),
            const Spacer(),
            ADRichText(
              ADTextSpan(
                text: 'Don’t have an account?',
                color: colors.textTetriary,
                style: ADTextStyle.bodyMedium,
                children: [
                  ADTextSpan(text: ' '),
                  ADTextSpan(
                    text: 'Sign up',
                    style: ADTextStyle.bodyMedium
                        .withWeight(ADFontWeight.semiBold),
                    color: colors.primary,
                    recognizer: signUpRecognizer,
                  ),
                ],
              ),
              style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.semiBold),
              color: colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
