import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';
import 'package:kabanta_app1/bluetooth/widgetsble.dart';
import 'package:kabanta_app1/variables.dart';

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
  late BluetoothService _service;
  BluetoothService get servis => _service;

  void updatestates(double newValue) {
    states = newValue;
    notifyListeners();
  }

  setInitService(servish){
    _service = servish;
    print("si se inicializa");
    print(_service);
    notifyListeners();
  }

  Future<void> writeCharacteristic() async {
      await _service.characteristics[8].setNotifyValue(true);
      await _service.characteristics[8].write([states.toInt()]);
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
        _activities[index] = _activities[index].copyWith(isComplete: true, service: _service);
        print('state id');
        updatestates(state.id);
        print(state.id);
        //print("sigue con datos");
        //print(_service);
       writeCharacteristic();
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
        isComplete: state.duration == Duration.zero,
        service: state.servicetest);
    if (_uistates.isEmpty) {
      _start();
    }
    final uistate = UIState(
        activityid: activity.id,
        id: state.type,
        duration: state.duration,
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

  UIState({
    required this.activityid,
    required this.duration,
    required this.id,
    required this.index,
  });

  UIState copyWith({
    final double? id,
    final Duration? duration,
    final int? index,
  }) {
    return UIState(
        activityid: activityid,
        duration: duration ?? this.duration,
        id: id ?? this.id,
        index: index ?? this.index);
  }
}

class ActivityTimer {
  final int id;
  final double type;
  final Duration duration;
  final bool isComplete;
  final BluetoothService service;

  ActivityTimer(
      {required this.id,
      required this.type,
      required this.duration,
      required this.isComplete,
      required this.service});

  ActivityTimer copyWith({
    final int? id,
    final double? type,
    final Duration? duration,
    final bool? isComplete,
    required final BluetoothService service
  }) {
    return ActivityTimer(
        id: id ?? this.id,
        type: type ?? this.type,
        duration: duration ?? this.duration,
        isComplete: isComplete ?? this.isComplete,
        service: service);
  }
}

class BLEWriteState {
  final String id;
  final String data;

  const BLEWriteState(this.id, this.data);
}
