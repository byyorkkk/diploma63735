import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/journal/model/journal_mood.dart';
import 'package:flutter/material.dart';

class JournalMoodFaceCircle extends StatelessWidget {
  const JournalMoodFaceCircle({
    super.key,
    required this.mood,
  });

  final JournalMood mood;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final icon = switch (mood) {
      JournalMood.sad => Assets.icons.x24.mood.sad,
      JournalMood.angry => Assets.icons.x24.mood.angry,
      JournalMood.happy => Assets.icons.x24.mood.happy,
      JournalMood.normal => Assets.icons.x24.mood.neutral,
      JournalMood.disappointed => Assets.icons.x24.mood.disappointed,
    };

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: icon.svg(
                colorFilter: ColorFilter.mode(
                  colors.primary,
                  BlendMode.srcIn,
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
