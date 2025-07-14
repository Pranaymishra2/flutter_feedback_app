import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Page1State()) {
    on<GoToPage1>((event, emit) => emit(Page1State()));
    on<GoToPage2>((event, emit) => emit(Page2State(event.username)));
    on<GoToPage3>((event, emit) => emit(Page3State()));
    on<GoToPage4>((event, emit) => emit(Page4State()));
  }
}
