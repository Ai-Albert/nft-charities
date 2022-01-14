class Milestone {
  Milestone({
    required this.id,
    required this.number,
    required this.goal,
    required this.done,
  });

  final String id;
  final int number;
  final String goal;
  final bool done;

  factory Milestone.fromMap(Map<String, dynamic> data, String id) {
    return Milestone(
      id: id,
      number: data['number'],
      goal: data['goal'],
      done: data['done'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'goal': goal,
      'done': done,
    };
  }
}
