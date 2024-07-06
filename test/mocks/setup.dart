import 'package:crypto_converter/domain/converter/usecases/list/list_exchange_rate_dto.dart';
import 'package:mocktail/mocktail.dart';

import 'storage.dart';

initAppMocks() {
  mockHydratedStorage();
}

registerFallbacks() {
  registerFallbackValue(InputListExchangeRateDto(cryptoCodes: List.empty(), currencyCode: ''));
}
