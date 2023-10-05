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
            title: Text(l10n.newPlaceAppBar),
            leading: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  l10n.cancelAppBar,
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
                  select: () {
                    _bloc.add(SelectCategoryEvent(
                      context: context,
                    ));
                  },
                  label: l10n.categoryButton,
                  selected: state.category ?? l10n.unselectedButton,
                ),
                const SizedBox(height: 24),
                OutlinedForm(
                  controller: _nameController,
                  label: l10n.placeNameTextField,
                  linesCount: 1,
                  isValid: state.isNameValid,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Flexible(
                      child: OutlinedForm(
                        controller: _latitudeController,
                        label: l10n.latitudeTextField,
                        linesCount: 1,
                        isValid: state.isLatitudeValid,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: OutlinedForm(
                        controller: _longitudeController,
                        label: l10n.longitudeTextField,
                        linesCount: 1,
                        isValid: state.isLongitudeValid,
                        textInputType: TextInputType.number,
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
                      l10n.pointOnTheMapButton,
                      style: TextStyle(color: colors.secondary),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                OutlinedForm(
                  controller: _descriptionController,
                  label: l10n.descriptionTextField,
                  linesCount: 5,
                ),
                BottomButton(
                  label: l10n.createButton,
                  onPressed: () {},
                  isActive: state.canCreate ?? false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
