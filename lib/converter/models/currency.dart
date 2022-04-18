//TODO: Review currency logic.
class Currency {
  final String code;

  const Currency({required this.code});
}

class SupportedCurrencies {
  static const Map<String, Currency> list = {
    'BRL': Currency(code: 'BRL'),
    'USD': Currency(code: 'USD'),
    'EUR': Currency(code: 'EUR'),
  };
}
