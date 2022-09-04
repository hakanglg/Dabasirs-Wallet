// ignore_for_file: constant_identifier_names

enum ImageItems {
  LoginImage,
  RegisterImage,
  GoogleIcon,
  ExpenseLogo,
  IncomeLogo,
  SavingLogo,
  TransactionNameLogo,
  AmountLogo,
  CongratsImage,
  OnboardOne,
  OnboardTwo,
  OnboardThree,
  OnboardFour,
  OnboardLive,
  OnboardSave,
  OnboardDebt,
  OnboardLearn
}

extension ImageItemsExtension on ImageItems {
  String _path() {
    switch (this) {
      case ImageItems.LoginImage:
        return "login_man";
      case ImageItems.RegisterImage:
        return "login_woman";
      case ImageItems.GoogleIcon:
        return "ic_google";
      case ImageItems.ExpenseLogo:
        return "ic_expense";
      case ImageItems.IncomeLogo:
        return "ic_income";
      case ImageItems.SavingLogo:
        return "ic_saving";
      case ImageItems.TransactionNameLogo:
        return "ic_transaction";
      case ImageItems.AmountLogo:
        return "ic_amount";
      case ImageItems.CongratsImage:
        return "img_congrats";
      case ImageItems.OnboardOne:
        return "onboard_one";
      case ImageItems.OnboardTwo:
        return "onboard_two";
      case ImageItems.OnboardThree:
        return "onboard_three";
      case ImageItems.OnboardFour:
        return "onboard_four";
      case ImageItems.OnboardLearn:
        return "img_learn";
      case ImageItems.OnboardLive:
        return "img_live";
      case ImageItems.OnboardDebt:
        return "debt";
      case ImageItems.OnboardSave:
        return "img_save";
    }
  }

  String get imagePathPng => "assets/images/${_path()}.png";
  String get imagePathJpg => "assets/images/${_path()}.jpg";
  String get imagePathSvg => "assets/images/${_path()}.svg";
}
