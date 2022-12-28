extension FirstLetterToUpperCase on String {
  String capitalizeFirstLetter() {
    return replaceRange(0, 1, substring(0, 1).toUpperCase());
  }
}
