class ValidateImage {
  static Uri network(String? url) => Uri.tryParse(url.toString()) ?? Uri();
}
