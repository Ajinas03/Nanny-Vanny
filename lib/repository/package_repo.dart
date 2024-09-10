import 'package:http/http.dart' as http;
import 'package:nanny_vanny/model/current_booking_model.dart';
import 'package:nanny_vanny/model/packges_model.dart';

class PackageRepo {
  Future<CurrentBookingModel> getCurrentBookingList() async {
    const String apiUrl =
        'https://www.cgprojects.in/lens8/api/dummy/current_booking_list';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return currentBookingListFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception(
            'Failed to load current booking list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      throw Exception('Error fetching current booking list: $e');
    }
  }

  Future<PackagesModel> getPackagesList() async {
    const String apiUrl =
        'https://www.cgprojects.in/lens8/api/dummy/packages_list';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return packagesModeFromJson(response.body);
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load packages list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      throw Exception('Error fetching packages list: $e');
    }
  }
}
