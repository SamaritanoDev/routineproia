import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:routineproia/src/constants/constants.dart';
import 'package:routineproia/src/features/generate_routine/data/models/routine.dart';

class GeneratedRoutineInstruction {
  Future<List<Routine>> generatedDataRoutine(
      Map<String, dynamic> userRoutine) async {
    //creamos una instancia del modelo Gemini y en generationConfig que sea json

    // Crear la instrucción para la IA y el esquema de la rutina debe ser un JSON
    // final prompt =
    //     'En idioma español, puedes generar una rutina completa en base a estas elecciones que hizo el usuario $userRoutine, '
    //     'porque eres un entrenador personal de ejercicio físico. Genera contenido utilizando este esquema JSON:\n\n'
    //     'Ordena cada rutina por objetivo (goal) con su respectivo ejercicio\n'
    //     'y el campo time que salga en minutos.\n'
    //     'Routine = [{"goal": string, "exercises": [{"name": String, "reps": String, "time": String, "recommendationsExercise": List<String>}]}]';

    //generación del contenido con el modelo Gemini basado en el prompt

    // Convertir la respuesta limpia en una lista de objetos Routine

    return [];
  }

  ///limpiar respuesta del  gemini: elimina el texto que no forma parte del formato json
  static String _cleanResponse(String response) {
    final firstCorchete = response.indexOf('[');
    final lastCorchete = response.lastIndexOf(']');
    String recortado = response.substring(firstCorchete, lastCorchete + 1);
    return recortado;
  }
}
