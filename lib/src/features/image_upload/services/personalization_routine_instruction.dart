import 'dart:typed_data';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:routineproia/src/constants/constants.dart';

class PersonalizationRoutineInstruction {
  ///crear el promt, inputs: texto (instruccion) y la foto (byets)
  Future<String> getContendCustomRoutine(Uint8List imageBytes) async {
    //crea una instancia del modelo de IA Gemini, usando el modelo gemini-1.5-flash y sin generationConfig


    //diseñamos la instrucción con el esquema CustomRoutineModel...
    // final prompt = TextPart(
    //     'En idioma español genera un único contenido o item, porque eres un entrenador personal de ejericio fisico, y en base a está imagen, que es un equipo de ejericio para entrenar, genera contenido utilizando este esquema JSON:\n\n'
    //     'Y para el campo availablePhotoEquipment lista los equipos que hay en la imagen o foto.\n'
    //     'Y para el campo experienceLevel que sea al menos dos niveles.\n'
    //     'CustomRoutineModel = {"idContentOptions": string, "exerciseGoal": List<String>, "experienceLevel": List<String>, "desiredDurationOfTheRoutine": List<String>, "availablePhotoEquipment": List<String>}\n'
    //     'Return: Array<CustomRoutineModel>');

    // crea el DataPart usando los bytes: la imagen se envía como una parte de los datos

    //Respuesta del gemini: senvía tanto el prompt como los datos de la imagen a la API de Gemini


    //elimina cualquier texto adicional que no forme parte del formato json 

    return "";
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
