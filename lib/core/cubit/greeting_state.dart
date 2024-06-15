part of 'greeting_cubit.dart';

sealed class GreetingState extends Equatable {
  const GreetingState();

  @override
  List<Object> get props => [];
}

final class GreetingInitial extends GreetingState {}
