import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc/core/constant/enums.dart';

part 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  GreetingCubit() : super(const GreetingState(greeting: Greeting.morning)) {
    int time = DateTime.now().hour;
    if (time > 0 && time <= 13) {
      emitGreeting(Greeting.morning);
    } else if (time > 13 && time <= 17) {
      emitGreeting(Greeting.afternoon);
    } else {
      emitGreeting(Greeting.evening);
    }
  }

  void emitGreeting(Greeting greeting) =>
      emit(GreetingState(greeting: greeting));
}
