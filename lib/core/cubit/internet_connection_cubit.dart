import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc/core/constant/enums.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final Connectivity connectivityPlus;
  StreamSubscription? connectivityPlusSubscription;

  InternetConnectionCubit({required this.connectivityPlus})
      : super(InternetConnectionLoading()) {
    connectivityPlusSubscription = connectivityPlus.onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        emitInternetConnected(Connection.mobile);
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        emitInternetConnected(Connection.wifi);
      } else if (!connectivityResult.contains(ConnectivityResult.none)) {
        emitInternetConnected(Connection.other);
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(Connection connection) =>
      emit(InternetConnected(connection: connection));
  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityPlusSubscription!.cancel();
    return super.close();
  }
}
