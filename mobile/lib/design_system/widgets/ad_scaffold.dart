import 'package:adhd_project/common/widgets/keyboard_dismisser.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/design_system/widgets/ad_opacity_page_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ADScaffold extends StatelessWidget {
  const ADScaffold({
    super.key,
    this.title,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.wrapInSafeArea = true,
    this.safeAreaBottom = true,
    this.actionInProgress = false,
  });

  final String? title;
  final Widget body;
  final ADAppBar? appBar;
  final Widget? bottomNavigationBar;
  final bool wrapInSafeArea;
  final bool safeAreaBottom;
  final bool actionInProgress;

  static const bottomMinimumSafeArea = 40.0;

  @override
  Widget build(BuildContext context) {
    return ADOpacityPageProgressIndicator(
      inProgress: actionInProgress,
      child: KeyboardDismisser(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            appBar: appBar,
            extendBody: true,
            body: wrapInSafeArea
                ? SafeArea(
                    top: appBar == null,
                    bottom: safeAreaBottom,
                    minimum: EdgeInsets.only(
                      bottom: safeAreaBottom ? bottomMinimumSafeArea : 0,
                    ),
                    child: body,
                  )
                : body,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ),
    );
  }
}
