// Função para parsear prazos do dropdown (dropdown_parser.dart)
List<int> parseIntervals(String prazo) {
  try {
    return prazo.split('/').map(int.parse).toList();
  } catch (e) {
    print('Erro ao parsear prazos: $e');
    return [];
  }
}
