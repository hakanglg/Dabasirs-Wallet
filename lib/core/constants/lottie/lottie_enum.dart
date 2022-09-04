enum LottieItems { error, empty }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.error:
        return "error";
      case LottieItems.empty:
        return "empty";
    }
  }

  String get lottiePath => "assets/lottie/lottie_${_path()}.json";
}
