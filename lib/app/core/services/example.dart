abstract class ExampleService {
  void salvarNoStorage(dynamic valor);
  dynamic pegarValorNoStorage(dynamic chave);
}

class ExampleServicePacote implements ExampleService {
  @override
  pegarValorNoStorage(chave) {
    // TODO: implement pegarValorNoStorage
    throw UnimplementedError();
  }

  @override
  void salvarNoStorage(valor) {
    // TODO: implement salvarNoStorage
  }
}
