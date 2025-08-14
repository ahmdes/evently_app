extension ButtonTextValidation on String {
  static String getStringAfterTrimmed(String text) {
    List<String> textBeforeTrimmed = text.split("");
    List<String> textAfterTrimmed = [];
    for (int i = 0; i < textBeforeTrimmed.length; i++) {
      if (textBeforeTrimmed[i].trim().isNotEmpty) {
        textAfterTrimmed.add(textBeforeTrimmed[i]);
      }
    }
    return textAfterTrimmed.join();
  }

  static bool isValidateString(String? text) {
    if (text != null && text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool isCharsMoreThan6(String? text) {
    if (text != null &&
        ButtonTextValidation.getStringAfterTrimmed(text).length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}
