class ResultSearch {
  final String title;
  final String img;
  final String content;

  ResultSearch({required this.title, required this.img, required this.content});
}
//Note: toJson e fromJson não é responsiblidade dele!! Nessa arquitetura ficam em uma outra camada!