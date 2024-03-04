import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider = Provider<String>((ref) {
  return 'Message from the provider...';
});