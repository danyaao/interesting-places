import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/features/place_list/bloc/place_list_bloc.dart';
import 'package:interesting_places/place_repository/place_repository.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({
    super.key,
    required this.placeRepository,
  });

  final PlaceRepository placeRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaceListBloc>(
      create: (context) => PlaceListBloc(
        placeRepository: placeRepository,
      ),
      child: const PlaceListWidget(),
    );
  }
}

class PlaceListWidget extends StatefulWidget {
  const PlaceListWidget({super.key});

  @override
  State<PlaceListWidget> createState() => _PlaceListWidgetState();
}

class _PlaceListWidgetState extends State<PlaceListWidget> {
  PlaceListBloc get _bloc => context.read<PlaceListBloc>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;

    return BlocConsumer<PlaceListBloc, PlaceListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.placeListAppBar),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.screenMargin),
            child: Stack(
              children: [
                Column(
                  children: [
                    const TextField(),
                    const SizedBox(height: 30),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _bloc.add(const PlaceListRefreshEvent());
                        },
                        child: state is PlaceListSuccessState
                            ? ListView.builder(
                                itemCount: state.places.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 188,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.memory(
                                              state.places[index].images.first,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            child:
                                                Text(state.places[index].name),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const FlutterLogo(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      _bloc.add(PlaceListCreatePlaceEvent(context: context));
                    },
                    child: Text(l10n.newPlaceButton),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
