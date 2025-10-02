import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/colors.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/features/cities/domain/entity/city_entity.dart';
import 'package:weather_app/features/cities/presentation/cities_search_view_model.dart';
import 'package:weather_app/features/cities/presentation/cities_search_state.dart';
import 'package:weather_app/features/cities/presentation/ui/city_search_bottom_sheet.dart';

class CityPickerField extends StatelessWidget {
  final ValueChanged<CityEntity>? onSelected;
  final CityEntity? initialCity;
  final String hintText;

  const CityPickerField({
    this.onSelected,
    this.initialCity,
    this.hintText = 'Search for a city',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesSearchViewModel, CitiesSearchState>(
      builder: (context, state) {
        return TextField(
          readOnly: true,
          controller: TextEditingController(text: initialCity?.name ?? ''),
          decoration: InputDecoration(
            hintText: 'Search for a city',
            fillColor: BrandColors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: BrandColors.grey,
            ),
            hintStyle: BrandTextStyle.s18w400.copyWith(
              color: BrandColors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 2,
                color: BrandColors.lightGrey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 2,
                color: BrandColors.lightGrey,
              ),
            ),
          ),
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Colors.transparent,
              builder: (sheetCtx) => BlocProvider.value(
                value: context.read<CitiesSearchViewModel>(),
                child: CitySearchBottomSheet(initialCity: initialCity),
              ),
            ).then((selected) {
              if (selected is CityEntity) {
                onSelected?.call(selected);
              }
            });
          },
        );
      },
    );
  }
}
