import 'package:flutter/material.dart';
import 'package:routineproia/src/constants/constants.dart';
import 'package:routineproia/src/features/generate_routine/data/models/routine.dart';

class RoutineScreen extends StatefulWidget {
  final List<Routine> routines;
  const RoutineScreen({
    super.key,
    required this.routines,
  });

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Map<String, Set<String>> completedExercises = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.routines.length, vsync: this);
    // Inicializar el estado de ejercicios completados
    for (var routine in widget.routines) {
      completedExercises[routine.goal] = {};
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleExerciseCompletion(String goal, String exerciseName) {
    setState(() {
      if (completedExercises[goal]!.contains(exerciseName)) {
        completedExercises[goal]!.remove(exerciseName);
      } else {
        completedExercises[goal]!.add(exerciseName);
      }
    });
  }

  int getCompletedCount(String goal) {
    return completedExercises[goal]!.length;
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodyTextStyleCard = textTheme.bodySmall?.copyWith(
      color: color.primary,
      fontWeight: FontWeight.bold,
    );
    final bodyTextTimeStyle =
        textTheme.bodyMedium?.copyWith(color: color.primary);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tu rutina de ejercicio"),
        backgroundColor: const Color(myColorPrimary),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: widget.routines.map((routine) {
            return Tab(text: routine.goal);
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.routines.map((routine) {
          final totalExercises = routine.exercises.length;
          final completedCount = getCompletedCount(routine.goal);
          final progress = completedCount / totalExercises;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Barra de progreso
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: color.surface,
                  color: const Color(colorSecondary),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: totalExercises,
                    itemBuilder: (context, index) {
                      final exercise = routine.exercises[index];
                      final isCompleted = completedExercises[routine.goal]!
                          .contains(exercise.name);

                      final titleStyleCard = textTheme.titleMedium?.copyWith(
                        color: isCompleted
                            ? color.tertiary
                            : const Color(
                                colorSecondary,
                              ),
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      );

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: isCompleted
                            ? const Color(myColorPrimary)
                            : color.surface,
                        child: CheckboxListTile(
                          fillColor: WidgetStatePropertyAll(
                              Color(isCompleted ? colorPrimary : 0xfffdf9ec)),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isCompleted,
                          onChanged: (_) => toggleExerciseCompletion(
                              routine.goal, exercise.name),
                          title: Text(exercise.name, style: titleStyleCard),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Repeticiones: ${exercise.reps}",
                                  style: bodyTextStyleCard),
                              Text("Tiempo: ${exercise.time}",
                                  style: bodyTextTimeStyle),
                              if (exercise.recommendationsExercise.isNotEmpty)
                                ExpansionTile(
                                  title: const Text(
                                    "Recomendaciones",
                                    style:
                                        TextStyle(color: Color(colorPrimary)),
                                  ),
                                  children: exercise.recommendationsExercise
                                      .map((rec) => ListTile(
                                            leading: const Icon(
                                              Icons.check,
                                              color: Color(colorPrimary),
                                            ),
                                            title: Text(rec,
                                                style: bodyTextTimeStyle),
                                          ))
                                      .toList(),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Marcar toda la rutina como completada
          setState(() {
            final currentGoal = widget.routines[_tabController.index].goal;
            completedExercises[currentGoal] = {
              for (var exercise
                  in widget.routines[_tabController.index].exercises)
                exercise.name
            };
          });
        },
        backgroundColor: const Color(colorSecondary),
        child: Icon(
          Icons.done_all,
          color: color.onPrimary,
        ),
      ),
    );
  }
}
