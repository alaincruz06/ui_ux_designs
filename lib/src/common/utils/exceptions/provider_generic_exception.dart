class ProviderGenericException implements Exception {
  final String code;
  final String message;

  const ProviderGenericException(this.code, this.message);

  @override
  String toString() =>
      'ProviderGenericException(code: $code, message: $message)';
}
