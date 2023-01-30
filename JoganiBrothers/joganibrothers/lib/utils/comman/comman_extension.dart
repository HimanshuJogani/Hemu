extension EmailValidator on String {
  bool isPlate() {
    return RegExp(
        r'^[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{2}[0-9]{4}$')
        .hasMatch(this);
  }

  bool isLicence() {
    return RegExp(r'(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$').hasMatch(this);
  }
}