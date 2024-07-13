part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({this.isLoading = false, required this.auth});

  final bool isLoading;
  final Auth auth;

  @override
  List<Object?> get props => [
        isLoading,
        auth,
      ];

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    String a = htmlText.replaceAll(exp, '');
    log('Replace html');
    log(a);
    return a;
  }
}
