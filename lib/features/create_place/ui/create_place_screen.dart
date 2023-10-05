import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/features/create_place/bloc/create_place_bloc.dart';

class CreatePlaceScreen extends StatelessWidget {
  const CreatePlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePlaceBloc>(
      create: (_) => CreatePlaceBloc(),
      child: const CreatePlaceWidget(),
    );
  }
}

class CreatePlaceWidget extends StatefulWidget {
  const CreatePlaceWidget({super.key});

  @override
  State<CreatePlaceWidget> createState() => _CreatePlaceWidgetState();
}

class _CreatePlaceWidgetState extends State<CreatePlaceWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final text = context.text;
    final colors = context.colors;

    return BlocBuilder<CreatePlaceBloc, CreatePlaceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.newPlace),
            leading: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  l10n.cancel,
                  style: text.superSmall,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
            child: Column(
              children: [
                const SizedBox(height: 24),
                PhotoPicker(
                  add: () {},
                  delete: () {},
                ),
                const SizedBox(height: 24),
                SelectButton(
                  select: () {},
                  label: l10n.category,
                  selected: l10n.unselected,
                ),
                const SizedBox(height: 24),
                OutlinedForm(
                  controller: nameController,
                  label: l10n.placeName,
                  linesCount: 1,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Flexible(
                      child: OutlinedForm(
                        controller: latitudeController,
                        label: l10n.latitude,
                        linesCount: 1,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: OutlinedForm(
                        controller: longitudeController,
                        label: l10n.longitude,
                        linesCount: 1,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.pointOnTheMap,
                      style: TextStyle(color: colors.secondary),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                OutlinedForm(
                    controller: descriptionController,
                    label: l10n.description,
                    linesCount: 5),
                BottomButton(
                  label: l10n.save,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
