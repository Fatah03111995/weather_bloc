import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  GreetingCubit() : super(GreetingInitial());
}
