import 'package:nif_web/services/network/config.dart';

String fetchImageUrl(String filePath) {
  if (filePath.isNotEmpty) {
    return "$baseUrl:$port/api/image?filepath=${filePath.trim()}";
  }
  return "https://placehold.co/600x400";
}
