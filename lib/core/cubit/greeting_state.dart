part of 'greeting_cubit.dart';

class GreetingState extends Equatable {
  final Greeting greeting;

  const GreetingState({required this.greeting});

  String get initialUppercase {
    String greeting = this.greeting.name;
    String convert = '';
    for (int i = 0; i < greeting.length; i++) {
      if (i == 0) {
        convert += greeting[i].toUpperCase();
      } else {
        convert += greeting[i];
      }
    }
    return convert;
  }

  String get sayGreeting => 'Good $initialUppercase';
  @override
  List<Object> get props => [];
}
