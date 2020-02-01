class CharacterState {
  int health;
  int suspicion;
  int money;

  CharacterState({
    this.health,
    this.suspicion,
    this.money
  });

  factory CharacterState.init() => CharacterState(health: 90, suspicion: 0, money: 50);

  @override
  String toString() {
    return 'health: $health, suspicion: $suspicion, money: $money';
  }
}