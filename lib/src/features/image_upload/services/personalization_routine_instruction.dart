import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';

class PersonalizationRoutineInstruction {
  ///crear el promt, inputs: texto (instruccion) y la foto (byets)
  Future<String> getContendCustomRoutine(Uint8List imageBytes) async {
    //instanciamos el modelo de gemini
    final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: 'valueApiKey',);

    //diseñamos la instrucción
    final prompt = TextPart(
        'En idioma español genera un único contenido o item, porque eres un entrenador personal de ejericio fisico, y en base a está imagen, que es un equipo de ejericio para entrenar, genera contenido utilizando este esquema JSON:\n\n'
        'Y para el campo availablePhotoEquipment lista los equipos que hay en la imagen o foto.\n'
        'Y para el campo experienceLevel que sea al menos dos niveles.\n'
        'CustomRoutineModel = {"idContentOptions": string, "exerciseGoal": List<String>, "experienceLevel": List<String>, "desiredDurationOfTheRoutine": List<String>, "availablePhotoEquipment": List<String>}\n'
        'Return: Array<CustomRoutineModel>');

    // Crea el DataPart usando los bytes
    final imageDataParts = [DataPart('image/png', imageBytes)];

    //Respuesta del gemini
    final response = await model.generateContent([
      Content.multi([prompt, ...imageDataParts])
    ]);

    print("sin limpiar: ${response.text!}");

    final cleanedResponseGemini = _cleanReponseGemini(response.text!);
    print("Respuesta limpia de Gemini: $cleanedResponseGemini");

    return cleanedResponseGemini;
  }

  String _cleanReponseGemini(String response) {
    // Busca el inicio de la lista JSON
    final startIndex = response.indexOf('[');
    // Busca el final de la lista JSON
    final endIndex = response.lastIndexOf(']');

    if (startIndex == -1 || endIndex == -1) {
      throw const FormatException('El JSON no tiene un formato válido.');
    }

    // Extrae solo el contenido de la lista JSON
    return response.substring(startIndex, endIndex + 1);
  }
}
