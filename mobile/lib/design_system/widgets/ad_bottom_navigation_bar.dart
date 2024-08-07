import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/home/home_navigation_cubit.dart';
import 'package:adhd_project/features/journal/journal_cubit.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:adhd_project/l10n/strings.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ADBottomNavigationBar extends StatelessWidget {
  const ADBottomNavigationBar({
    super.key,
    required this.currentTab,
  });

  final HomeScreenTabState currentTab;

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);
    final colors = ADColors.of(context);
    const barRadius = BorderRadius.vertical(top: Radius.circular(16));

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: barRadius,
              boxShadow: ADShadows.of(context).bottomNarBar,
            ),
          ),
        ),
        IntrinsicHeight(
          child: Material(
            color: colors.background,
            borderRadius: barRadius,
            child: ClipRRect(
              borderRadius: barRadius,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 8),
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ADBottonNavigationBarItem(
                          icon: ADIcon(icon: Assets.icons.x24.home, size: 24),
                          text: s.bottomNavBar_home,
                          selected: currentTab == HomeScreenTabState.home,
                          onTap: () => context
                              .read<HomeNavigationCubit>()
                              .navigate(HomeScreenTabState.home),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ADBottonNavigationBarItem(
                          icon: ADIcon(icon: Assets.icons.x24.tasks, size: 24),
                          text: s.bottomNavBar_tasks,
                          selected: currentTab == HomeScreenTabState.tasks,
                          onTap: () => context
                              .read<HomeNavigationCubit>()
                              .navigate(HomeScreenTabState.tasks),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Material(
                        color: [
                          HomeScreenTabState.journal,
                          HomeScreenTabState.tasks,
                        ].contains(currentTab)
                            ? colors.primary
                            : colors.backgroundTetriary,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).push(
                              currentTab == HomeScreenTabState.tasks
                                  ? CreateTaskRoute<void>(
                                      initialDateTimestamp: context
                                          .read<TasksCubit>()
                                          .state
                                          .maybeMap(
                                            ready: (state) => state.selectedDay,
                                            orElse: DateTime.now,
                                          )
                                          .millisecondsSinceEpoch,
                                    ).location
                                  : CreateCalendarRecordRoute<void>(
                                      initialDateTimestamp: context
                                          .read<JournalCubit>()
                                          .state
                                          .maybeMap(
                                            ready: (state) => state.focusedDay,
                                            orElse: DateTime.now,
                                          )
                                          .millisecondsSinceEpoch,
                                    ).location,
                            );
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            child: ADIcon(
                              icon: Assets.icons.x24.add,
                              color: ADColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ADBottonNavigationBarItem(
                          icon:
                              ADIcon(icon: Assets.icons.x24.calendar, size: 24),
                          text: s.bottomNavBar_calendar,
                          selected: currentTab == HomeScreenTabState.journal,
                          onTap: () => context
                              .read<HomeNavigationCubit>()
                              .navigate(HomeScreenTabState.journal),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ADBottonNavigationBarItem(
                          icon:
                              ADIcon(icon: Assets.icons.x24.profile, size: 24),
                          text: s.bottomNavBar_profile,
                          selected: currentTab == HomeScreenTabState.settings,
                          onTap: () => context
                              .read<HomeNavigationCubit>()
                              .navigate(HomeScreenTabState.settings),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ADBottonNavigationBarItem extends StatelessWidget {
  const ADBottonNavigationBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final ADIcon icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final color = selected ? colors.primary : colors.iconSecondary;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 4),
            icon.withColor(color),
            const SizedBox(height: 2),
            ADText(
              text,
              color: color,
              textAlign: TextAlign.center,
              style: ADTextStyle.bodyXSmall.withWeight(
                selected ? ADFontWeight.bold : ADFontWeight.regular,
              ),
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
