import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:routineproia/src/common_widgets/common_widgets.dart';
import 'package:routineproia/src/constants/constants.dart';
import 'package:routineproia/src/features/custom_routine/data/models/custom_routine_model.dart';
import 'package:routineproia/src/features/custom_routine/services/generated_routine_instruction.dart';
import 'package:routineproia/src/features/generate_routine/data/models/routine.dart';

class CustomRoutineScreen extends StatelessWidget {
  final List<CustomRoutineModel> contentOptions;
  final Uint8List imageBytes;

  const CustomRoutineScreen({
    super.key,
    required this.contentOptions,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleLarge?.copyWith(
      color: const Color(colorSecondary),
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RotinePro IA'),
        backgroundColor: const Color(myColorPrimary),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personaliza tu Rutina', style: titleStyle),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'para este equipo de entrenamiento',
                        style: titleStyle,
                      ),
                    ),
                    ImagePreview(imageBytes: imageBytes),
                  ],
                ),
                const Text(
                  'Este contenido se ha generado con la IA Generativa de Gemini',
                  style: TextStyle(color: Color(colorSecondary)),
                ),
                Image.asset(personalTraining),
                const SizedBox(height: 20),
                _FormPersonalizationRoutine(contentOptions: contentOptions),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormPersonalizationRoutine extends StatefulWidget {
  final List<CustomRoutineModel> contentOptions;
  const _FormPersonalizationRoutine({
    required this.contentOptions,
  });

  @override
  State<_FormPersonalizationRoutine> createState() =>
      __FormersonalizationRoutineState();
}

class __FormersonalizationRoutineState
    extends State<_FormPersonalizationRoutine> {
  // Nueva instancia para almacenar las selecciones
  final CustomRoutineModel userSelection = CustomRoutineModel(
    idContentOptions: '',
    exerciseGoal: [],
    experienceLevel: [],
    desiredDurationOfTheRoutine: [],
    availablePhotoEquipment: [],
  );
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.bodyLarge
        ?.copyWith(color: color.primary, fontWeight: FontWeight.bold);
    final valueLabelStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nivel de experiencia (DropdownButton)
        Text('Nivel de experiencia', style: labelStyle),
        //Recorremos la lista  contentOptions
        for (final option in widget.contentOptions)
          DropdownButton<String>(
            value: userSelection.experienceLevel.isEmpty
                ? null
                : userSelection.experienceLevel.first,
            hint: Text("Escojamos el nivel", style: valueLabelStyle),
            items: option.experienceLevel.map((String level) {
              return DropdownMenuItem(
                value: level,
                child: Text(level, style: valueLabelStyle),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                userSelection.experienceLevel = [value ?? ''];
              });
            },
          ),
        const SizedBox(height: 20),

        // Duración deseada de la rutina (ChoiceChip)
        Text('Duración deseada de la rutina', style: labelStyle),
        for (final option in widget.contentOptions)
          Wrap(
            spacing: 10,
            children: option.desiredDurationOfTheRoutine.map((String duration) {
              return ChoiceChip(
                label: Text(duration, style: valueLabelStyle),
                selected: userSelection.desiredDurationOfTheRoutine
                    .contains(duration),
                onSelected: (isSelected) {
                  setState(() {
                    userSelection.desiredDurationOfTheRoutine =
                        isSelected ? [duration] : [];
                  });
                },
              );
            }).toList(),
          ),
        const SizedBox(height: 20),

        // Objetivos del ejercicio (CheckboxListTile)
        Text('Objetivos del ejercicio', style: labelStyle),
        for (final option in widget.contentOptions)
          Column(
            children: option.exerciseGoal.map((String goal) {
              return CheckboxListTile(
                title: Text(goal, style: valueLabelStyle),
                value: userSelection.exerciseGoal.contains(goal),
                onChanged: (bool? isChecked) {
                  setState(() {
                    if (isChecked == true) {
                      userSelection.exerciseGoal.add(goal);
                    } else {
                      userSelection.exerciseGoal.remove(goal);
                    }
                  });
                },
              );
            }).toList(),
          ),
        const SizedBox(height: 20),

        // Equipos disponibles (SwitchListTile)
        Text('Equipos disponibles', style: labelStyle),
        for (final option in widget.contentOptions)
          Column(
            children: option.availablePhotoEquipment.map((String equipment) {
              final isSelected =
                  userSelection.availablePhotoEquipment.contains(equipment);
              return SwitchListTile(
                title: Text(equipment, style: valueLabelStyle),
                value: isSelected,
                onChanged: (bool isChecked) {
                  setState(() {
                    if (isChecked) {
                      userSelection.availablePhotoEquipment.add(equipment);
                    } else {
                      userSelection.availablePhotoEquipment.remove(equipment);
                    }
                  });
                },
              );
            }).toList(),
          ),
        const SizedBox(height: 20),
        if (isLoading) const LoadingCustom(),
        // Botón para enviar
        Align(
          alignment: Alignment.center,
          child: MyOutlinedButton(
            valueTitle: 'Generar mi rutina con IA',
            onPressed: () {
              _submitForm();
            },
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    setState(() {
      isLoading = true;
    });

    //convertir la selección del usuario  (userSelection) a un formato JSON llamando al método toJson

    //se hace una llamada asincrónica a generatedDataRoutine para obtener la rutina personalizada, pasando los datos del usuario

    //se detiene el indicador de carga y se navega a  RoutineScreen
  }
}
