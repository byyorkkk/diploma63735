import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/auth/presentation/auth_cubit.dart';
import 'package:adhd_project/features/settings/widgets/settings_tab_item.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ADScaffold(
      appBar: const ADAppBar(
        title: ADText('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            SettingsTabItem(
              routeLocation: PomodoroSettingsRoute<void>().location,
              title: 'Pomo Settings',
              iconData: Assets.icons.x24.star,
            ),
            const Spacer(),
            ADPrimaryButton(
              label: 'Log out',
              onPressed: context.read<AuthCubit>().signOut,
            ),
          ],
        ),
      ),
    );
  }
}
