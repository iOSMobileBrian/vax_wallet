

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/vaccine_constants.dart';
import '../Models/vaccine_model.dart';
import '../Providers/index_provider.dart';
import '../Providers/vaccine_provider_viewlist.dart';

class VaxInfoScreen extends StatelessWidget {
  const VaxInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vax = Provider.of<VaccineProviderViewList>(context);
    final index = Provider.of<IndexProvider>(context);
    String firstDate = '';
    String secondDate = '';
    String maker = '';
    String vaxName = '';
    String boosterDate = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text(VaxConstants.vaccineScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(VaxConstants.vaccineInfoTitle),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                vaxName = value.toUpperCase();
              },
              decoration: const InputDecoration(
                hintText: 'Enter Vaccine Name',
              ),
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                maker = value.toUpperCase();
              },
              decoration: const InputDecoration(
                hintText: 'Enter Vaccine Maker',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.datetime,
              textAlign: TextAlign.center,
              onChanged: (value) {
                firstDate = value.toUpperCase();
              },
              decoration: const InputDecoration(
                hintText: 'Enter Date of first shot',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.datetime,
              textAlign: TextAlign.center,
              onChanged: (value) {
                secondDate = value.toUpperCase();
              },
              decoration: const InputDecoration(
                hintText: 'Enter Date of Second shot or Not Required',
              ),
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.datetime,
              textAlign: TextAlign.center,
              onChanged: (value) {
                boosterDate = value.toUpperCase();
              },
              decoration: const InputDecoration(
                hintText: 'Enter Date of Booster shot or Not Required',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final vaccine = VaccineModel(
                      maker: maker,
                      firstDate: firstDate,
                      vaccineName: vaxName,
                      secondDate: secondDate,
                      boosterDate: boosterDate);
                  vax.addVaccine(vaccine);
                  index.updateIndex(0);
                },
                child: const Text('Add vaccine')),
          ],
        ),
      ),
    );
  }
}
