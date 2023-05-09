class ConfigSlice {
  final bool? usePlatformEnv;
  const ConfigSlice({this.usePlatformEnv});
}

class ConfigKey {
  final bool? envDisabled;
  final bool? usePlatformEnv;
  final String envKey;
  final Function(String input)? transformer;
  const ConfigKey(
      {required this.envKey,
      this.envDisabled,
      this.usePlatformEnv,
      this.transformer});
}
