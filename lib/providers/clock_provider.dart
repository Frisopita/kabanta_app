import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';

class ClockService extends ChangeNotifier {
  final List<ActivityTimer> _activities = [];
  List<UIState> _uistates = [];
  Timer? _countdownTimer;
  Duration _duration = Duration.zero;
  double? _id;
  double? get id => _id;
  Duration get duration => _duration;
  bool get isActive => _duration != Duration.zero;
  Stream<List<BLEWriteState>> _stream = const Stream.empty();
  Stream<List<BLEWriteState>> get stream => _stream;
  late double states;

  void updatestates(double newValue) {
    states = newValue;
    notifyListeners();
  }

  Future<void> writeCharacteristic(BluetoothService servish) async {
      await servish.characteristics[8].setNotifyValue(true);
      await servish.characteristics[8].write([states.toInt()]);
      print(states);
  }

  void _start() {
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) => _updateList());
  }

  void _cancel() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }

  void _updateList() {
    if (_uistates.isEmpty) {
      _cancel();
      return;
    }

    final List<UIState> internalList = [];

    for (var i in _uistates) {
      final state = i.duration == Duration.zero
          ? i
          : i.copyWith(duration: i.duration - const Duration(seconds: 1));

      if (state.duration == Duration.zero) {
        final index =
            _activities.indexWhere((element) => element.id == state.activityid);
        _activities[index] = _activities[index].copyWith(isComplete: true);
        print('state id');
        updatestates(state.id);
        print(state.id);
        //print("sigue con datos");
        //print(_service);
       writeCharacteristic(state.service);
      } else {
        internalList.add(state);
      }
    }

    if (internalList.isEmpty) {
      _cancel();
    }

    _uistates = internalList;
    notifyListeners();
  }

  List<UIState> get uiStates => _uistates;

  List<ActivityTimer> get activities => _activities.where((element) => element.isComplete).toList();

  void addState(({double type, Duration duration, BluetoothService servicetest}) state) {
    final activity = ActivityTimer(
        id: _activities.length,
        type: state.type,
        duration: state.duration,
        isComplete: state.duration == Duration.zero);
    if (_uistates.isEmpty) {
      _start();
    }
    final uistate = UIState(
        activityid: activity.id,
        id: state.type,
        duration: state.duration,
        service: state.servicetest,
        index: _uistates.length);
    _activities.add(activity);
    _uistates.add(uistate);
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

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}

class UIState {
  final int activityid;
  final double id;
  final Duration duration;
  final int index;
  final BluetoothService service;

  UIState({
    required this.activityid,
    required this.duration,
    required this.id,
    required this.index,
    required this.service
  });

  UIState copyWith({
    final double? id,
    final Duration? duration,
    final int? index,
    //required final BluetoothService service
  }) {
    return UIState(
        activityid: activityid,
        duration: duration ?? this.duration,
        id: id ?? this.id,
        index: index ?? this.index,
        service: service
        );
  }
}

class ActivityTimer {
  final int id;
  final double type;
  final Duration duration;
  final bool isComplete;

  ActivityTimer(
      {required this.id,
      required this.type,
      required this.duration,
      required this.isComplete,
    });

  ActivityTimer copyWith({
    final int? id,
    final double? type,
    final Duration? duration,
    final bool? isComplete,
  }) {
    return ActivityTimer(
        id: id ?? this.id,
        type: type ?? this.type,
        duration: duration ?? this.duration,
        isComplete: isComplete ?? this.isComplete,
        );
  }
}

class BLEWriteState {
  final String id;
  final String data;

  const BLEWriteState(this.id, this.data);
}
