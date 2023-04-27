import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stopify/features/radio/data/models/radio_model.dart';

Future<RadioMetadata> fetchRadioMetadata() async {
  final response = await http
      .get(Uri.parse('https://api.radioking.io/widget/radio/bankable-radio'));

  if (response.statusCode == 200) {
    return RadioMetadata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load metadata');
  }
}
