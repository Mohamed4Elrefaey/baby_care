import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/vaccination/data/datasources/vaccination_local_data_source.dart';
import 'package:baby_care/features/vaccination/data/datasources/vaccination_remote_data_source.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dartz/dartz.dart';

import 'vaccination_repository.dart';

class VaccinationRepositoryImpl implements VaccinationRepository {
  final VaccinationRemoteDataSource remoteDataSource;
  final VaccinationLocalDataSource localDataSource;
  final Connectivity connectivity;
  VaccinationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, List<List<VaccineRecordModel>>>> getVaccination(
    String id,
  ) async {
    if (await hasConnection()) {
      var response = await remoteDataSource.getVaccineRecordList(id);
      if (response.statusCode == 200) {
        List<VaccineRecordModel> upcomingList = [];
        List<VaccineRecordModel> historyList = [];

        for (var element in (response.data['schedule'] as List<dynamic>)) {
          if (element['status'] == 'upcoming') {
            upcomingList.add(VaccineRecordModel.fromJson(element));
          } else {
            historyList.add(VaccineRecordModel.fromJson(element));
          }
        }

        List<List<VaccineRecordModel>> listToReturn = [
          upcomingList,
          historyList,
        ];
        await localDataSource.cacheScheduleRecordList(listToReturn, id);

        return right(listToReturn);
      } else {
        return left(ServerFailure('there was ${response.statusCode}'));
      }
    } else {
      var list = await localDataSource.getCachedScheduleRecordList(id);
      if (list != null) {
        return right(list);
      } else {
        return left(ServerFailure('no data'));
      }
    }
  }

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }

  @override
  Future<Either<Failure, List<VaccineRecordModel>>> getVaccinationHome(
    String id,
  ) async {
    if (await hasConnection()) {
      var response = await remoteDataSource.getVaccineRecordListHome(id);
      if (response.statusCode == 200) {
        List<VaccineRecordModel> recordList = [];

        for (var element in (response.data['schedule'] as List<dynamic>)) {
          if (element['status'] == 'upcoming') {
            recordList.add(VaccineRecordModel.fromJson(element));
          }
        }

        await localDataSource.cacheScheduleRecordListHome(recordList, id);

        return right(recordList);
      } else {
        return left(ServerFailure('there was ${response.statusCode}'));
      }
    } else {
      var list = await localDataSource.getCachedScheduleRecordListHome(id);
      if (list != null) {
        return right(list);
      } else {
        return left(ServerFailure('no data'));
      }
    }
  }
}
