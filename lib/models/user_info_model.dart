
class ZegoInfo {
  String id = '';
  String name = '';

  ZegoInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  ZegoInfo.empty();
}
