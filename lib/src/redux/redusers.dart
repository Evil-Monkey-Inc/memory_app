import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';

AppState reducer(AppState state, dynamic action){
  if(action is AddAction){
    return AppState(counter: state.counter + 1, text: state.text);
  }
  else if(action is SetTextAction){
    return AppState(counter: state.counter, text: action.text);
  }
  else{
    return state;
  }
}