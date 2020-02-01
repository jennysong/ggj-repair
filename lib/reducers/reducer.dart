import 'package:ggj_repair/actions/actions.dart';
import 'package:ggj_repair/models/models.dart';

CharacterState appReducer(CharacterState state, dynamic action) {
  
  if (action is IncrementHealth) {
    state.health += action.additionalhealth;
  }
  return state;
}

