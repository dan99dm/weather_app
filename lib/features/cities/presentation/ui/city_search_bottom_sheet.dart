import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';
import 'package:weather_app/features/cities/presentation/cities_search_state.dart';
import 'package:weather_app/features/cities/presentation/cities_search_view_model.dart';

class CitySearchBottomSheet extends StatefulWidget {
  final CityEntity? initialCity;

  const CitySearchBottomSheet({
    required this.initialCity,
    super.key,
  });

  @override
  State<CitySearchBottomSheet> createState() => _CitySearchBottomSheetState();
}

class _CitySearchBottomSheetState extends State<CitySearchBottomSheet> {
  late final TextEditingController _controller;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<CitiesSearchViewModel>();
    _controller = TextEditingController(text: widget.initialCity?.name ?? '');
    if (_controller.text.isNotEmpty) {
      viewModel.searchCities(_controller.text);
    }
    _controller.addListener(() => viewModel.searchCities(_controller.text));
    Future.microtask(() => _focus.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Type a city',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _controller.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _controller.clear();
                            context.read<CitiesSearchViewModel>().searchCities('');
                          },
                        ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CitiesSearchViewModel, CitiesSearchState>(
                builder: (context, state) {
                  switch (state) {
                    case CitiesSearchBadRequestErrorState():
                      return const _BottomSheetMessage(text: 'Bad request');
                    case CitiesSearchLoadingState():
                      return const _BottomSheetMessage.loading();
                    case CitiesSearchNetworkErrorState():
                      return const _BottomSheetMessage(text: 'Network error');
                    case CitiesSearchUnknownErrorState():
                      return const _BottomSheetMessage(text: 'Unknown error');
                    case CitiesSearchInitialState():
                      return const _BottomSheetMessage(
                        text: 'Enter a city name to start searching (min 3 characters)',
                      );
                    case CitiesSearchLoadedState():
                      final items = state.cities;
                      if (items.isEmpty) {
                        return const _BottomSheetMessage(text: 'No cities found');
                      }
                      return ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final city = items[i];
                          return ListTile(
                            title: Text('${city.name} ${city.countryCode}'),
                            onTap: () {
                              Navigator.of(context).pop(city);
                            },
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetMessage extends StatelessWidget {
  final String? text;
  final bool isLoading;

  const _BottomSheetMessage({
    this.text,
    this.isLoading = false,
  });

  const _BottomSheetMessage.loading()
      : text = null,
        isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(text ?? '', textAlign: TextAlign.center),
      ),
    );
  }
}
