import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADPicture extends StatelessWidget {
  const ADPicture({
    super.key,
    required this.picture,
    this.size,
    this.fit = BoxFit.cover,
  });

  final SvgGenImage picture;
  final double? size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    var path = picture.path;
    final subfolder = path.contains('light/')
        ? 'light/'
        : path.contains('dark/')
            ? 'dark/'
            : null;

    if (subfolder != null) {
      final newFolder = switch (Theme.of(context).brightness) {
        Brightness.light => 'light/',
        Brightness.dark => 'dark/',
      };
      path = path.replaceFirst(subfolder, newFolder);
    }

    return picture.svg(
      width: size,
      fit: fit,
    );
  }
}
