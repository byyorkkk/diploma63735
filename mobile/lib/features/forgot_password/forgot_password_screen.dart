import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/forgot_password/forgot_password_cubit.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc(() => ForgotPasswordCubit(context.read()));
    final state = useBlocState(cubit);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final emailController = useTextEditingController();

    useOnStreamChange(
      cubit.presentation,
      onData: (event) async {
        switch (event) {
          case ForgotPasswordSendSuccessEvent(:final email):
            await showSuccessSnackbar(
              context: context,
              text:
                  'Successfully sent reset password email. Open the link in your inbox and reset the password',
            );
            await GoRouter.of(context).push(
              ResetPasswordRoute<void>(email: email).location,
            );
            return;
          case ForgotPasswordSendErrorEvent():
            showErrorSnackbar(
              context: context,
              text: 'Failed to send reset password link',
            );
        }
      },
    );

    return ADScaffold(
      actionInProgress: state == ForgotPasswordState.sending,
      appBar: const ADAppBar(
        title: ADText('Forgot Password'),
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
                  picture: Assets.pictures.light.forgotPassword,
                ),
                const SizedBox(height: 80),
                ADEmailTextField(controller: emailController),
                const SizedBox(height: 80),
                ADPrimaryButton(
                  label: 'Send reset password email',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      cubit.sendResetPasswordLink(emailController.text);
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
