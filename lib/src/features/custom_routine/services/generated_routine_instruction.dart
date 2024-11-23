import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:routineproia/src/features/generate_routine/data/models/routine.dart';

class GeneratedRoutineInstruction {
   Future<List<Routine>> generatedDataRoutine(
      Map<String, dynamic> userRoutine) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'valueAPIKey',
      generationConfig: GenerationConfig(responseMimeType: 'application/json'),
    );
    print("userRoutine: $userRoutine");

    // Crear la instrucción para la IA
    final prompt =
        'En idioma español, puedes generar una rutina completa en base a estas elecciones que hizo el usuario $userRoutine, '
        'porque eres un entrenador personal de ejercicio físico. Genera contenido utilizando este esquema JSON:\n\n'
        'Ordena cada rutina por objetivo (goal) con su respectivo ejercicio\n'
        'y el campo time que salga en minutos.\n'
        'Routine = [{"goal": string, "exercises": [{"name": String, "reps": String, "time": String, "recommendationsExercise": List<String>}]}]';

    final response = await model.generateContent([Content.text(prompt)]);
    final cleanedResponse = _cleanResponse(response.text!);

    // Convertir la respuesta limpia en una lista de objetos Routine
    return routineFromJson(cleanedResponse);
  }

  static String _cleanResponse(String response) {
    final firstCorchete = response.indexOf('[');
    final lastCorchete = response.lastIndexOf(']');
    String recortado = response.substring(firstCorchete, lastCorchete + 1);
    return recortado;
  }
}