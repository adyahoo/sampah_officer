part of 'services.dart';

class InputSampahService {
  static Future<ApiReturnValue<String>> storeSampah(
      int nasabahId, List<InputSampahModel> sampahs,
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/transaksi/store';

    String? token = await getUserToken();

    List<Map<String, dynamic>> transaksi = [];

    for (var i = 0; i < sampahs.length; i++) {
      Map<String, dynamic> transaksiData = {
        'jenis_sampah_id': sampahs[i].jenis_sampah_id,
        'berat': sampahs[i].berat
      };

      transaksi.add(transaksiData);
    }

    var response = await client.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(
            {"nasabah_id": nasabahId, "detail_transaksi": transaksi}));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: '${data['message']}');
    }

    return ApiReturnValue(status: true, message: data['message']);
  }
}
