import 'package:flutter_hooks/flutter_hooks.dart';

T useDisposable<T extends Object>(
  T Function() builder,
  void Function() Function(T) dispose, [
  List<Object?> keys = const [],
]) {
  final disposable = useMemoized(builder, keys);

  useEffect(
    () {
      return () => dispose(disposable);
    },
    [keys],
  );

  return disposable;
}
