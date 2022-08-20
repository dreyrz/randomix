abstract class IStrings {
  ///General
  String get welcome;
  String get continuee;
  String get goodMorning;
  String get goodAfternoon;
  String get goodNight;
  String get goodDawn;

  ///About
  String get aboutDescription;
}

class BrazilianPortugueseStrings implements IStrings {
  @override
  String get aboutDescription =>
      'Escolha as músicas conforme seu humor do dia.';
  @override
  String get continuee => 'Continuar';
  @override
  String get welcome => 'Bem vindo!';
  @override
  String get goodMorning => 'Bom dia!';
  @override
  String get goodAfternoon => 'Boa tarde!';
  @override
  String get goodNight => 'Boa noite!';
  @override
  String get goodDawn => 'Boa madrugada!';
}
