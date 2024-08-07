import 'package:adhd_project/common/hooks/use_on_delete_item_listener.dart';
import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pills/delete_pill_cubit.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/pills/widgets/pill_styled_text.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

class PillsListScreen extends HookWidget {
  const PillsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final cubit = context.watch<PillsCubit>();
    final state = cubit.state;

    final deleteCubit = useBloc(
      () => DeletePillCubit(context.read()),
    );

    useOnDeleteItemListener(deleteCubit, (event) {
      switch (event) {
        case DeleteItemSuccessEvent():
          showSuccessSnackbar(
            context: context,
            text: 'Successfully removed the pill',
          );
        case DeleteItemErrorEvent():
          showErrorSnackbar(
            context: context,
            text: 'Failed to remove the pill',
          );
      }
    });

    return ADScaffold(
      wrapInSafeArea: false,
      safeAreaBottom: false,
      appBar: ADAppBar(
        title: const ADText('Your pills'),
        action: ADTetriaryButton(
          onPressed: () {
            GoRouter.of(context).push(CreatePillRoute<void>().location);
          },
          leadingIcon: ADIcon(
            size: 24,
            icon: Assets.icons.x24.add,
            color: ADColors.of(context).icon,
          ),
          label: 'Add pill',
        ),
      ),
      body: state.map(
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (state) => ADCommonErrorRefetchWidget(onRefetch: cubit.fetch),
        ready: (state) => ListView.builder(
          itemCount: state.pills.length,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 80),
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colors.backgroundSecondary,
            ),
            child: Row(
              children: [
                Expanded(
                  child: PillStyledText(
                    pill: state.pills[index],
                  ),
                ),
                const SizedBox(width: 12),
                ADEditDeleteOptionsButton(
                  itemType: ADConfirmDeleteItemType.pill,
                  onDeletePressed: () => deleteCubit.delete(state.pills[index]),
                  onEditPressed: () => GoRouter.of(context).push(
                    EditPillRoute<void>(pillId: state.pills[index].pillID!)
                        .location,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
