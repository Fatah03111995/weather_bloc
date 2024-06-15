import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc/core/constant/enums.dart';

part 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  GreetingCubit() : super(const GreetingState(greeting: Greeting.morning));

  void emitGreeting(Greeting greeting) =>
      emit(GreetingState(greeting: greeting));
}
