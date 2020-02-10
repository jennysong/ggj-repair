class Character {
  String id;
  String name;
  List<String> emotions;

  Character({ this.id, this.name, this.emotions });

  static List<Character> fromJson(Map parsedJson) {
    return parsedJson['characters'].map((attrs) {
      return new Character(
        id: attrs['id'],
        name: attrs['name'],
        emotions: attrs['emotions']
      );
    }).toList();
  }
}