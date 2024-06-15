part of 'internet_connection_cubit.dart';

sealed class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object> get props => [];
}

final class InternetConnectionLoading extends InternetConnectionState {}

final class InternetConnected extends InternetConnectionState {
  final Connection connection;

  const InternetConnected({required this.connection});

  @override
  List<Object> get props => [connection];
}

final class InternetDisconnected extends InternetConnectionState {}
