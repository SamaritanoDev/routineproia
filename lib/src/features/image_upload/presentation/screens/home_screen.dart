import 'package:flutter/material.dart';
import 'package:routineproia/src/common_widgets/image_custom.dart';
import 'package:routineproia/src/common_widgets/loading_custom.dart';
import 'package:routineproia/src/constants/constants.dart';
import 'package:routineproia/src/features/image_upload/presentation/widgets/option_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final myName =
        textTheme.labelLarge?.copyWith(color: const Color(colorPrimary));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(myColorPrimary),
        title: const Text(
          'RutinaPro IA: Generador de Rutina',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              const ImageCustom(imagePath: fitnessApp),
              const _Contend(),
              const SizedBox(height: 30),

              //opciones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionCustom(
                    icon: Icons.photo,
                    label: 'Escoger de Galeria',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 80),
                  OptionCustom(
                    icon: Icons.photo_camera,
                    label: 'Tomar Foto',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              isLoading ? const LoadingCustom() : const SizedBox(),
              const SizedBox(height: 30),
              const Spacer(),
              Text('Hecho por Lesly Samaritano | Flutterina Studio',
                  style: myName),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _Contend extends StatelessWidget {
  const _Contend();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle =
        textTheme.headlineSmall?.copyWith(color: color.secondary);
    final subtitleStyle = textTheme.titleMedium;
    final subtitleBoldStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);

    return Column(
      children: [
        Text('Sube una Foto de tu Equipo', style: titleStyle),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            text: 'Toma o selecciona una foto del ',
            style: subtitleStyle,
            children: [
              TextSpan(text: 'equipo de ejercicio ', style: subtitleBoldStyle),
              TextSpan(text: 'que tienes disponible.', style: subtitleStyle),
            ],
          ),
        ),
      ],
    );
  }
}
