import 'package:async_redux/async_redux.dart';

abstract class LoadingAction<St> extends ReduxAction<St> {
  LoadingAction({this.actionKey});
  final String? actionKey;

  @override
  void before() => dispatch(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}
