import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ClockService extends ChangeNotifier {
  final List<_StateTimerBLE> _states = [];
  Timer? _countdownTimer;
  Duration _duration = Duration.zero;

  Duration get duration => _duration;
  bool get isActive => _duration != Duration.zero;

  List<UIState> get uiStates => _states
    .mapIndexed((index, s) => UIState(duration: s.initialDuration, id: s.id, index: index))
    .toList();

  void addState(({double id, Duration duration}) state) {
    final _state = _StateTimerBLE(state.id, state.duration, this);
    _states.add(_state);
    _state.start();
  }

  void startTimer(Duration duration) {
    if (_countdownTimer != null) {
      _countdownTimer!.cancel();
    }
    _duration = duration;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration -= const Duration(seconds: 1);
      if (duration == Duration.zero) {
        _countdownTimer!.cancel();
      }
    });
  }

  void _internalNotifer() => notifyListeners();

  void deleteState(int index) {
    final state = _states.removeAt(index);
    state.dispose();
    notifyListeners();
  }

  void _deleteInternalState(_StateTimerBLE internalState) {
    _states.remove(internalState);
    notifyListeners();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}

class UIState {
  final double id;
  final Duration duration;
  final int index;

  UIState({
    required this.duration,
    required this.id,
    required this.index,
  });
}

class _StateTimerBLE {
  final double id;
  final ClockService service;
  Timer? timer;
  Duration initialDuration;

  _StateTimerBLE(
    this.id,
    this.initialDuration,
    this.service,
  );

  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      initialDuration -= const Duration(seconds: 1);
      if (initialDuration == Duration.zero) {
        service._deleteInternalState(this);
        dispose();
      }
      service._internalNotifer();
    });
  }

  void dispose() {
    timer?.cancel();
  }
}
