import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'classes.dart';

void mockHydratedStorage() => HydratedBloc.storage = _buildMockStorage();

Storage _buildMockStorage() {
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}
