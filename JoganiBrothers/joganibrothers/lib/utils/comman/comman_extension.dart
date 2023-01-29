extension EmailValidator on String {
  bool isPlate() {
    return RegExp(
        r'(^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$)')
        .hasMatch(this);
  }
}