import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pills/pill_form/pill_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

enum PillFormScreenType { create, edit }

class PillFormScreen extends HookWidget {
  const PillFormScreen({
    super.key,
    required this.type,
    this.pill,
  }) : assert(
          type == PillFormScreenType.create || pill != null,
        );

  final PillFormScreenType type;
  final PillDto? pill;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc(() => PillFormCubit(context.read()));
    final state = useBlocState(cubit);

    useOnStreamChange(
      cubit.presentation,
      onData: (event) async {
        final typeText = type == PillFormScreenType.create ? 'saved' : 'edited';
        switch (event) {
          case PillFormSaveSuccessEvent():
            await showSuccessSnackbar(
              context: context,
              text: 'Successfully $typeText the pill',
              async: true,
            );
            GoRouter.of(context).pop();
            return;

          case PillFormSaveErrorEvent():
            showSuccessSnackbar(
              context: context,
              text: 'Failed to $typeText the pill. Please try again later.',
            );
        }
      },
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController(text: pill?.pillName);
    final doseController = useTextEditingController(text: pill?.pillDose);

    return ADScaffold(
      wrapInSafeArea: false,
      safeAreaBottom: false,
      actionInProgress: state == PillFormState.saving,
      appBar: ADAppBar(
        title: ADText(
          '${type == PillFormScreenType.create ? 'Create' : 'Edit'} pill',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              ADTextField(
                labelText: 'Name',
                controller: nameController,
                validator: requiredFieldValidator,
              ),
              const SizedBox(height: 24),
              ADTextField(
                labelText: 'Dose',
                controller: doseController,
                validator: requiredFieldValidator,
              ),
              const SizedBox(height: 80),
              ADPrimaryButton(
                label: 'Save',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    switch (type) {
                      case PillFormScreenType.create:
                        cubit.createPill(
                          name: nameController.text,
                          dose: doseController.text,
                        );
                        return;
                      case PillFormScreenType.edit:
                        cubit.editPill(
                          pill: pill!,
                          name: nameController.text,
                          dose: doseController.text,
                        );
                        return;
                    }
                  }
                },
              ),
              const BottomPageSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}
