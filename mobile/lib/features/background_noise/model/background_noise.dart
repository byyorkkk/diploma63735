class BackgroundNoise {
  const BackgroundNoise({
    required this.name,
    required this.versions,
  });

  final String name;
  final List<BackgroundNoiseVersion> versions;
  // TODO: More variables for data
}

class BackgroundNoiseVersion {
  const BackgroundNoiseVersion({
    required this.duration,
    required this.assetPath,
  });

  final Duration duration;
  final String assetPath;
}
