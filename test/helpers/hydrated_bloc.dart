import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void initHydratedStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  HydratedBloc.storage = storage;
}
