class CharacterState {
  int health;
  int suspicion;
  int money;
  bool show;

  CharacterState({
    this.health,
    this.suspicion,
    this.money,
    this.show
  });

  factory CharacterState.init() => CharacterState(health: 100, suspicion: 0, money: 500);

  @override
  String toString() {
    return 'health: $health, suspicion: $suspicion, money: $money, show: $show';
  }
}