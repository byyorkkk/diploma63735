import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/auth/presentation/auth_cubit.dart';
import 'package:adhd_project/features/auth/presentation/auth_validators.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

enum _AuthScreenType { register, logIn }

class AuthScreen extends HookWidget {
  const AuthScreen.register({super.key}) : _type = _AuthScreenType.register;
  const AuthScreen.logIn({super.key}) : _type = _AuthScreenType.logIn;

  final _AuthScreenType _type;

  void _navigateToOpositePage(BuildContext context) {
    final router = GoRouter.of(context);
    final location = switch (_type) {
      _AuthScreenType.logIn => RegisterRoute<void>().location,
      _AuthScreenType.register => LogInRoute<void>().location,
    };
    final routes = router.routerDelegate.currentConfiguration.matches;
    final containsLocation = routes.any(
      (e) => e.matchedLocation == location,
    );
    if (containsLocation && router.canPop()) {
      router.pop();
    } else {
      router.push(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final cubit = context.watch<AuthCubit>();
    final state = cubit.state;

    final busy = state.busy;
    final requiresEmailConfirmation = state.requiresEmailConfirmation;
    final required2FAConfirmation = state.required2FAConfirmation;

    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final codeController = useTextEditingController();

    useBlocListener(
      bloc: cubit,
      listener: (state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).go(HomeRoute<void>().location);
        }
      },
    );

    void onAuthActionPressed() {
      if (formKey.currentState?.validate() ?? false) {
        switch (_type) {
          case _AuthScreenType.logIn:
            if (required2FAConfirmation) {
              cubit.confirmFACode(
                email: emailController.text,
                code: codeController.text,
              );
              return;
            }

            cubit.signInWithPassword(
              email: emailController.text,
              password: passwordController.text,
            );
          case _AuthScreenType.register:
            if (requiresEmailConfirmation) {
              return;
            } else {
              cubit.register(
                email: emailController.text,
                username: usernameController.text,
                password: passwordController.text,
              );
            }
        }
      }
    }

    final bottomTextRecognizer = useMemoized(
      () => TapGestureRecognizer()
        ..onTap = () {
          _navigateToOpositePage(context);
        },
    );
    final forgotPasswordRecognizer = useMemoized(
      () => TapGestureRecognizer()
        ..onTap = () {
          GoRouter.of(context).push(ForgotPasswordRoute<void>().location);
        },
    );

    useEffect(
      () {
        Future<void> listener(AuthState authState) async {
          if (authState.requiresEmailConfirmation) {
            await showInfoSnackbar(
              context: context,
              async: true,
              text:
                  'We have sent you an email with a confirmation link. Open it and sign in.',
            );

            _navigateToOpositePage(context);
            return;
          }
        }

        final subscription = cubit.stream.listen(listener);

        return subscription.cancel;
      },
      [],
    );

    return ADScaffold(
      actionInProgress: busy,
      safeAreaBottom: false,
      appBar: const ADAppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 64),
                ADAutoSizeText(
                  switch (_type) {
                    _AuthScreenType.logIn => 'Login to your Account',
                    _AuthScreenType.register => 'Create your Account',
                  },
                  style: ADTextStyle.h1,
                  maxLines: 2,
                ),
                const SizedBox(height: 64),
                ADEmailTextField(
                  controller: emailController,
                ),
                if (_type == _AuthScreenType.register) ...[
                  const SizedBox(height: 16),
                  ADTextField(
                    labelText: 'Username',
                    validator: requiredFieldValidator,
                    controller: usernameController,
                    prefixIcon: ADIcon(
                      icon: Assets.icons.x24.user,
                      color: colors.icon,
                      size: 20,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                ADPasswordTextField(
                  controller: passwordController,
                  validator: passwordValidator,
                ),
                if (_type == _AuthScreenType.register) ...[
                  const SizedBox(height: 16),
                  ADPasswordTextField(
                    label: 'Repeat password',
                    controller: repeatPasswordController,
                    validator: (text) => retypePasswordValidator(
                      text,
                      passwordController.text,
                    ),
                  ),
                ],
                if (required2FAConfirmation) ...[
                  const SizedBox(height: 16),
                  ADTextField(
                    labelText: 'Confirmation code',
                    controller: codeController,
                    validator: requiredFieldValidator,
                  ),
                ],
                const SizedBox(height: 48),
                ADPrimaryButton(
                  label: switch (_type) {
                    _AuthScreenType.logIn => 'Sign in',
                    _AuthScreenType.register => 'Sign up',
                  },
                  onPressed: onAuthActionPressed,
                ),
                if (state.error case final error?) ...[
                  const SizedBox(height: 48),
                  ADText(
                    error.toString(),
                    style: ADTextStyle.bodyMedium,
                    color: colors.error,
                  ),
                ],
                if (_type == _AuthScreenType.logIn) ...[
                  const SizedBox(height: 24),
                  ADRichText(
                    ADTextSpan(
                      text: 'Forgot the password?',
                      recognizer: forgotPasswordRecognizer,
                    ),
                    style: ADTextStyle.bodyLarge
                        .withWeight(ADFontWeight.semiBold)
                        .withDecoration(TextDecoration.underline),
                    color: colors.primary,
                  ),
                ],
                const SizedBox(height: 80),
                ADRichText(
                  ADTextSpan(
                    text: switch (_type) {
                      _AuthScreenType.logIn => 'Don’t have an account?',
                      _AuthScreenType.register => 'Already have an account?',
                    },
                    color: colors.textTetriary,
                    style: ADTextStyle.bodyMedium,
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: switch (_type) {
                          _AuthScreenType.logIn => 'Sign up',
                          _AuthScreenType.register => 'Sign in',
                        },
                        style: ADTextStyle.bodyMedium
                            .withWeight(ADFontWeight.semiBold)
                            .copyWith(color: colors.primary),
                        recognizer: bottomTextRecognizer,
                      ),
                    ],
                  ),
                  style:
                      ADTextStyle.bodyMedium.withWeight(ADFontWeight.semiBold),
                  color: colors.primary,
                ),
                const BottomPageSpacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
