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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  CreatePlaceBloc get _bloc => context.read<CreatePlaceBloc>();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      _bloc.add(
        NameChangedEvent(name: _nameController.text),
      );
    });

    _latitudeController.addListener(() {
      _bloc.add(
        LatitudeChangedEvent(latitude: _latitudeController.text),
      );
    });

    _longitudeController.addListener(() {
      _bloc.add(
        LongitudeChangedEvent(longitude: _longitudeController.text),
      );
    });

    _descriptionController.addListener(() {
      _bloc.add(
        DescriptionChangedEvent(description: _descriptionController.text),
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    final text = context.text;
    final colors = context.colors;

    return BlocConsumer<CreatePlaceBloc, CreatePlaceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                  add: () {
                    _bloc.add(const PickImagesFromGalleryEvent());
                  },
                  delete: (index) {
                    _bloc.add(DeleteImageFromSelectionEvent(index: index));
                  },
                  images: state.images ?? [],
                ),
                const SizedBox(height: 24),
                SelectButton(
                  select: () {},
                  label: l10n.category,
                  selected: l10n.unselected,
                ),
                const SizedBox(height: 24),
                OutlinedForm(
                  controller: _nameController,
                  label: l10n.placeName,
                  linesCount: 1,
                  isValid: state.isNameValid,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Flexible(
                      child: OutlinedForm(
                        controller: _latitudeController,
                        label: l10n.latitude,
                        linesCount: 1,
                        isValid: state.isLatitudeValid,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: OutlinedForm(
                        controller: _longitudeController,
                        label: l10n.longitude,
                        linesCount: 1,
                        isValid: state.isLongitudeValid,
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
                  controller: _descriptionController,
                  label: l10n.description,
                  linesCount: 5,
                ),
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
