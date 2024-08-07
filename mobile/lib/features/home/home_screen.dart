import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/home/home_navigation_cubit.dart';
import 'package:adhd_project/features/journal/journal_cubit.dart';
import 'package:adhd_project/features/journal/journal_screen.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/settings/settings_screen.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:adhd_project/features/tasks/tasks_screen.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationCubit = context.watch<HomeNavigationCubit>();
    final navigationState = navigationCubit.state;

    // Initialize home cubits
    useEffect(
      () {
        context.read<TasksCubit>().fetch();
        context.read<JournalCubit>().fetch();
        context.read<PillsCubit>().fetch();
        return;
      },
      [],
    );

    // TODO: Update title & path for home screens
    return ADScaffold(
      bottomNavigationBar: ADBottomNavigationBar(currentTab: navigationState),
      body: switch (navigationState) {
        HomeScreenTabState.home => const _HomeView(),
        HomeScreenTabState.tasks => const TasksScreen(),
        HomeScreenTabState.settings => const SettingsScreen(),
        HomeScreenTabState.journal => const JournalScreen(),
      },
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final router = GoRouter.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _FancyContainer(
                    onPressed: () =>
                        router.push(PlayBackgroundNoiseRoute<void>().location),
                    constraints: constraints,
                    backgroundColor: colors.secondary,
                    icon: Icons.audiotrack_outlined,
                    label: 'White\nNoise',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _FancyContainer(
                    onPressed: () =>
                        router.push(PomodoroRoute<void>().location),
                    constraints: constraints,
                    backgroundColor: colors.primary,
                    icon: Icons.timer,
                    label: 'Pomodoro\nTimer',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FancyContainer extends StatelessWidget {
  const _FancyContainer({
    required this.onPressed,
    required this.constraints,
    required this.icon,
    required this.backgroundColor,
    required this.label,
  });

  final VoidCallback onPressed;
  final BoxConstraints constraints;
  final IconData icon;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (constraints.maxWidth - 16) / 2,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            const Spacer(),
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            ADText(
              label,
              style: ADTextStyle.h4,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
