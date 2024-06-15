part of 'greeting_cubit.dart';

class GreetingState extends Equatable {
  final Greeting greeting;

  const GreetingState({required this.greeting});

  String get sayGreeting => 'Good ${greeting.name}';
  @override
  List<Object> get props => [];
}
