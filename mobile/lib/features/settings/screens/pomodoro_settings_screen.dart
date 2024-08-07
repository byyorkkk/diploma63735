import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:adhd_project/features/settings/widgets/settings_checkbox_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PomodoroSettingsScreen extends HookWidget {
  const PomodoroSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SettingsCubit>();
    final state = cubit.state;

    final silentMode = useState(state.pomodoroSilentMode);
    final vibrationEnabled = useState(state.pomodoroVibrationEnabled);

    final pomodoroRoundDuration = useState(state.pomodoroRoundDuration);
    final longBreakDuration = useState(state.pomodoroLongBreakDuration);
    final shortBreakDuration = useState(state.pomodoroShortBreakDuration);

    return ADScaffold(
      appBar: const ADAppBar(
        title: ADText('Pomodoro Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            SettingsCheckboxItem(
              title: 'Silent Mode',
              value: silentMode.value,
              onChanged: (value) {
                silentMode.value = value;
                cubit.setPomodoroSilentMode(value);
              },
            ),
            const SizedBox(height: 16),
            SettingsCheckboxItem(
              title: 'Vibration',
              value: vibrationEnabled.value,
              onChanged: (value) {
                vibrationEnabled.value = value;
                cubit.setPomodoroVibrationEnabled(value);
              },
            ),
            const SizedBox(height: 24),
            // TODO: Optimize sliders with Timer to not spam with async requests (onChange
            // is called during every slider step)
            ADSlider(
              label: 'Pomodoro Round (min)',
              min: 1,
              max: 90,
              value: pomodoroRoundDuration.value.inMinutes,
              onChange: (value) {
                pomodoroRoundDuration.value = Duration(minutes: value);
                cubit.setPomodoroRoundDuration(pomodoroRoundDuration.value);
              },
            ),
            const SizedBox(height: 24),
            ADSlider(
              label: 'Long Break (min)',
              min: 1,
              max: 90,
              value: longBreakDuration.value.inMinutes,
              onChange: (value) {
                longBreakDuration.value = Duration(minutes: value);
                cubit.setPomodoroLongBreakDuration(longBreakDuration.value);
              },
            ),
            const SizedBox(height: 24),
            ADSlider(
              label: 'Short Break (min)',
              min: 1,
              max: 90,
              value: shortBreakDuration.value.inMinutes,
              onChange: (value) {
                shortBreakDuration.value = Duration(minutes: value);
                cubit.setPomodoroShortBreakDuration(shortBreakDuration.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
