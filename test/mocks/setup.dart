import 'package:crypto_converter/modules/converter/usecases/list_exchange_rate/list_exchange_rate_dto.dart';
import 'package:mocktail/mocktail.dart';

import 'storage.dart';

initAppMocks() {
  mockHydratedStorage();
}

registerFallbacks() {
  registerFallbackValue(InputListExchangeRateDto(cryptoCodes: List.empty(), currencyCode: ''));
}
