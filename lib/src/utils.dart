extension PowerString on String {
  String strip(String whatToStrip) {
    int startIndex = 0, endIndex = length - 1;

    for (int i = 0; i <= length; i++) {
      if (i == length) {
        return '';
      }
      if (!whatToStrip.contains(this[i])) {
        startIndex = i;
        break;
      }
    }

    for (int i = length - 1; i >= 0; i--) {
      if (!whatToStrip.contains(this[i])) {
        endIndex = i;
        break;
      }
    }

    return substring(startIndex, endIndex + 1);
  }
}
