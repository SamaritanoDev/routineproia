import 'dart:convert';

List<Routine> routineFromJson(String str) =>
    List<Routine>.from(json.decode(str).map((x) => Routine.fromJson(x)));

String routineToJson(List<Routine> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Routine {
  String goal;
  List<Exercise> exercises;

  Routine({
    required this.goal,
    required this.exercises,
  });

  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        goal: json["goal"],
        exercises: List<Exercise>.from(
            json["exercises"].map((x) => Exercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "goal": goal,
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
      };
}

class Exercise {
  String name;
  String reps;
  String time;
  List<String> recommendationsExercise;

  Exercise({
    required this.name,
    required this.reps,
    required this.time,
    required this.recommendationsExercise,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        name: json["name"],
        reps: json["reps"],
        time: json["time"],
        recommendationsExercise:
            List<String>.from(json["recommendationsExercise"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "reps": reps,
        "time": time,
        "recommendationsExercise":
            List<dynamic>.from(recommendationsExercise.map((x) => x)),
      };
}
