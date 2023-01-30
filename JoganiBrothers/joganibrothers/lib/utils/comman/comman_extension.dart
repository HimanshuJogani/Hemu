extension EmailValidator on String {
  bool isPlate() {
    return RegExp(
        r'^[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{2}[0-9]{4}$')
        .hasMatch(this);
  }
}