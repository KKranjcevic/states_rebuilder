part of '../injected.dart';

///implementation of [Injected] for future injection
class InjectedFuture<T> extends Injected<T> {
  final T _initialValue;

  ///implementation of [Injected] for future injection
  InjectedFuture(
    Future<T> Function() creationFunction, {
    bool autoDisposeWhenNotUsed = true,
    void Function(T s) onData,
    void Function(dynamic e, StackTrace s) onError,
    void Function() onWaiting,
    void Function(T s) onInitialized,
    void Function(T s) onDisposed,
    bool isLazy = true,
    T initialValue,
    int undoStackLength,
  })  : _initialValue = initialValue,
        super(
          autoDisposeWhenNotUsed: autoDisposeWhenNotUsed,
          onData: onData,
          onError: onError,
          onWaiting: onWaiting,
          onInitialized: onInitialized,
          onDisposed: onDisposed,
          undoStackLength: undoStackLength,
        ) {
    _creationFunction = creationFunction;
    if (!isLazy) {
      _stateRM;
    }
  }

  @override
  String get _name => '___Injected${hashCode}Future___';
  @override
  void injectFutureMock(Future<T> Function() creationFunction) {
    _creationFunction = creationFunction;
    _cashedMockCreationFunction ??= _creationFunction;
  }

  @override
  Inject<T> _getInject() => Inject<T>.future(
        () => _creationFunction() as Future<T>,
        name: _name,
        initialValue: _initialValue,
        isLazy: false,
      );
}
