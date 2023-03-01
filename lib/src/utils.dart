/// SPDX-License-Identifier: AGPL-3.0-or-later
extension PowerString on String {
  String strip(String whatToStrip) {
    var startIndex = 0, endIndex = length - 1;

    for (var i = 0; i <= length; i++) {
      if (i == length) {
        return '';
      }
      if (!whatToStrip.contains(this[i])) {
        startIndex = i;
        break;
      }
    }

    for (var i = length - 1; i >= 0; i--) {
      if (!whatToStrip.contains(this[i])) {
        endIndex = i;
        break;
      }
    }

    return substring(startIndex, endIndex + 1);
  }
}
