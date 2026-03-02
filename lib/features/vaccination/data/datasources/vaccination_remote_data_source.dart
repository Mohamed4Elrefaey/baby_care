import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class VaccinationRemoteDataSource {
  Future<Response> getVaccineRecordList(String childId);
  Future<Response> getVaccineRecordListHome(String childId);
}

class VaccinationRemoteDataSourceImpl implements VaccinationRemoteDataSource {
  final ApiHelper apiHelper;
  VaccinationRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<Response> getVaccineRecordList(String childId) async {
    final response = await apiHelper.get(
      ApiEndpoints.childVaccinationSchedule(childId),
      requiresAuth: true,
    );

    return response;
  }

  @override
  Future<Response<dynamic>> getVaccineRecordListHome(String childId) async {
    final response = await apiHelper.get(
      ApiEndpoints.childVaccinationSchedule(childId),
      requiresAuth: true,
    );

    return response;
  }
}
