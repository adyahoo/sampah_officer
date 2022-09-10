part of 'services.dart';

class TransaksiService {
  static Future<ApiReturnValue<List<TransaksiModel>>> getTransaksi(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/transaksi/get-transaksi';

    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<TransaksiModel> transaksis = data['transaksi'] != null
        ? (data['transaksi'] as Iterable)
            .map((e) => TransaksiModel.fromJson(e))
            .toList()
        : [];

    return ApiReturnValue(
        status: true, value: transaksis, message: data['message']);
  }
}
