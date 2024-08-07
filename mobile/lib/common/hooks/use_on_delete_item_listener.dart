import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

void useOnDeleteItemListener<T extends Object, C extends DeleteItemCubit<T>>(
  C cubit,
  ValueChanged<DeleteItemEvent<T>> onEvent,
) {
  useOnStreamChange(
    cubit.presentation,
    onData: onEvent,
  );
}
