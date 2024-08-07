import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/auth/presentation/auth_validators.dart';
import 'package:adhd_project/features/reset_password/reset_password_cubit.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends HookWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc(() => ResetPasswordCubit(context.read()));
    final state = useBlocState(cubit);

    useOnStreamChange(
      cubit.presentation,
      onData: (event) async {
        switch (event) {
          case ResetPasswordSendSuccessEvent():
            await showSuccessSnackbar(
              context: context,
              text: 'Successfully changed password',
            );
            GoRouter.of(context).go(LogInRoute<void>().location);
            return;
          case ResetPasswordSendErrorEvent():
            showErrorSnackbar(
              context: context,
              text: 'Failed to change password',
            );
        }
      },
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final codeController = useTextEditingController();

    return ADScaffold(
      actionInProgress: state == ResetPasswordState.loading,
      appBar: const ADAppBar(
        title: ADText('Create New Password'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 48),
                ADPicture(
                  picture: Assets.pictures.light.resetPassword,
                ),
                const SizedBox(height: 24),
                const ADText(
                  'Create Your New Password',
                  style: ADTextStyle.bodyLarge,
                ),
                const SizedBox(height: 48),
                ADPasswordTextField(
                  controller: passwordController,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 24),
                ADPasswordTextField(
                  label: 'Repeat password',
                  controller: repeatPasswordController,
                  validator: (text) => retypePasswordValidator(
                    text,
                    passwordController.text,
                  ),
                ),
                const SizedBox(height: 24),
                ADPasswordTextField(
                  label: 'Confirmation code',
                  controller: codeController,
                  validator: requiredFieldValidator,
                ),
                const SizedBox(height: 48),
                ADPrimaryButton(
                  label: 'Reset password',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      cubit.resetPassword(
                        email: email,
                        password: passwordController.text,
                        confirmPassword: repeatPasswordController.text,
                        code: codeController.text,
                      );
                    }
                  },
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
