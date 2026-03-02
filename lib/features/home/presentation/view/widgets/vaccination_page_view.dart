import 'package:baby_care/features/home/presentation/view/widgets/vaccination_card.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:flutter/material.dart';

class VaccinationPageView extends StatelessWidget {
  const VaccinationPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
    required this.vaccineRecords,
  });

  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final List<VaccineRecordModel> vaccineRecords;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: PageView.builder(
        padEnds: false,
        controller: controller,
        itemCount: vaccineRecords.length > 3 ? 3 : vaccineRecords.length,

        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: VaccinationCard(vaccineRecord: vaccineRecords[index]),
          );
        },
      ),
    );
  }
}
