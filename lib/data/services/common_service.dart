part of 'services.dart';

class CommonService {
  static Future<ApiReturnValue<List<NasabahModel>>> getNasabah(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/transaksi/get-nasabah';

    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<NasabahModel> nasabahs = (data['nasabah'] as Iterable)
        .map((e) => NasabahModel.fromJson(e))
        .toList();

    return ApiReturnValue(
        status: true, value: nasabahs, message: data['message']);
  }

  static Future<ApiReturnValue<List<JenisSampahModel>>> getJenisSampah(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/transaksi/get-jenis-sampah';

    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<JenisSampahModel> jenisSampahs = (data['jenis_sampah'] as Iterable)
        .map((e) => JenisSampahModel.fromJson(e))
        .toList();

    return ApiReturnValue(
        status: true, value: jenisSampahs, message: data['message']);
  }
}
