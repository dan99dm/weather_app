# Weather App

This project is designed using **Clean Architecture** principles to ensure scalability, maintainability, and testability.

**Weather App** allows users to view the current weather in a selected city. It includes two main features:
- **City Search**: Search for cities to select the desired location.
- **Weather Display**: Show the current weather for the selected city.

---
## Dependencies

The project uses the following key dependencies:

- **Dio**: For making HTTP requests and handling API communication.
- **JsonSerializable**: For JSON serialization and deserialization.
- **GetIt**: For dependency injection, ensuring loose coupling between components.
- **Cubit**: For state management, providing a simple and predictable way to manage application state.

---

## Project Structure

The project is organized into a modular structure following **Clean Architecture** principles. Each feature is divided into three layers: **data**, **domain**, and **presentation**. This separation ensures a clear flow of data and dependency inversion.

### `lib/features`

This folder contains all the app's features. Each feature is self-contained and follows the **Clean Architecture** structure.

### `lib/features/cities`

This feature handles city-related functionality, such as fetching and displaying city data. It is divided into the following layers:

- **`data/`**: Contains the data layer, which includes:
  - **DTOs**: Data Transfer Objects for API communication.
  - **Mappers**: Extensions to convert DTOs into domain entities.
  - **Repositories**: Implementations of domain repositories, handling data sources (e.g., API, local storage).

- **`domain/`**: Contains the core business logic, including:
  - **Entities**: Core models representing the business logic.
  - **Use Cases**: Classes encapsulating specific business rules or operations.
  - **Repositories interfaces**: For Dependency Inversion

- **`presentation/`**: Contains the UI layer, including:
  - **View models**: State management logic for the feature.
  - **Widgets**: UI components for displaying city data.

### `lib/features/weather_checker`

This feature is responsible for fetching and displaying weather data for cities. It follows the same **Clean Architecture** structure as `cities`:

- **`data/`**: Handles API communication and data mapping.
- **`domain/`**: Contains weather-related entities and use cases.
- **`presentation/`**: Manages the UI and state for weather data.

---

## Why Clean Architecture?

The project uses **Clean Architecture** to ensure:

- **Separation of Concerns**: Each layer has a distinct responsibility, making the code easier to understand and maintain.
- **Dependency Inversion**: High-level modules (e.g., domain) do not depend on low-level modules (e.g., data). Instead, abstractions are used to invert dependencies.
- **Testability**: Each layer can be tested independently, ensuring robust and reliable code.


---

## Error Handling

The application includes a robust error handling mechanism to ensure a smooth user experience. Errors are categorized and handled at different layers of the architecture, following **Clean Architecture** principles. Below is a detailed explanation of how errors are managed, along with code examples.

### **Data Layer**

In the data layer, errors are primarily related to network requests and API responses. The `RemoteExecutor` class handles HTTP requests and maps errors to specific types using the `ApiResponseErrorType` enum.

#### Example: Handling API Errors in `RemoteExecutor`
```dart
final res = await call(dio);
final code = res.statusCode ?? 0;
if (successCodes.contains(code)) {
  return ApiResponseData(data: parse(res.data));
}
if (code >= 400 && code < 500) {
  return ApiResponseError.badRequest();
}
if (code >= 500) {
  return ApiResponseError.internalError();
}
return ApiResponseError.unknown();
} on DioException catch (e) {
  return _mapDioException(e);
} catch (err) {
  return ApiResponseError.unknown();
}
```

### **Domain Layer**

In the domain layer, use cases handle errors by returning a `Result` type, which encapsulates either a success (`Ok`) or a failure (`Err`). This ensures that the business logic remains unaffected by low-level implementation details.

#### Example: Use Case Returning a `Result`
```dart
Future<Result<List<CityEntity>>> searchCities({
  required String keyword,
  required int limit,
}) async {
  if (keyword.length < 3) {
    return Err(ValidationFailure());
  }
  return _repository.searchCities(
    keyword: keyword,
    limit: limit,
  );
}
```

### **Presentation Layer**

In the presentation layer, errors are exposed to the UI through state management. The `CitiesSearchViewModel` emits specific error states based on the result of the use case.

#### Example: Emitting Error States in `CitiesSearchViewModel`
```dart
switch (citiesResult) {
  case Ok(value: final cities):
    emit(CitiesSearchLoadedState(cities: cities));
  case Err(failure: ApiFailure(errorType: ApiResponseErrorType.network)):
    emit(CitiesSearchNetworkErrorState());
  case Err(failure: ValidationFailure()):
  case Err(failure: ApiFailure(errorType: ApiResponseErrorType.badRequest)):
    emit(CitiesSearchBadRequestErrorState());
  case Err():
    emit(CitiesSearchUnknownErrorState());
}
```

### **UI Layer**

The UI listens for error states and displays appropriate messages to the user. For example, the `BlocBuilder` in the `CitySearchBottomSheet` widget renders different widgets based on the current state.

#### Example: Handling Error States in the UI
```dart
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
```

### **Summary**

- Data Layer: Errors related to network requests and API responses are caught and categorized (e.g., network errors, bad requests) to prevent low-level issues from propagating further.
- Domain Layer: The core business logic validates input data and handles errors by returning meaningful results (e.g., ValidationError for invalid input). This ensures that the domain layer enforces business rules and remains independent of external systems.
- Presentation Layer: Errors from the domain layer are translated into specific states (e.g., CitiesSearchBadRequestErrorState) that the UI can easily interpret.
- UI Layer: The user interface listens for error states and provides clear, user-friendly feedback (e.g., displaying error messages or retry options) without crashing the application.