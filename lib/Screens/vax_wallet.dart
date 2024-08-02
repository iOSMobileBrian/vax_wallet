import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../Constants/vaccine_constants.dart';
import '../Models/vaccine_model.dart';
import '../Providers/vaccine_provider_viewlist.dart';

class VaxWallet extends StatelessWidget {
  const VaxWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VaccineProviderViewList>(context);
    final List<VaccineModel> list = provider.vaccineList;

    return Scaffold(
      backgroundColor: Colors.black,
      body: list.isNotEmpty
          ? SafeArea(
              minimum: const EdgeInsets.symmetric(vertical: 10),
              top: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomScrollView(
                    //physics: ClampingScrollPhysics(),
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final vax = list[index];
                          return StickyHeader(
                              header: Stack(
                                children: [
                                  Container(
                                    height: 16,
                                    color: index > 0 ? VaxConstants.cardColors[index - 1] : Colors.transparent,
                                  ),
                                  InkWell(
                                    onTap: () => provider.reorderList(index),
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
                                        color: VaxConstants.cardColors[index],
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Vaccine: ${vax.vaccineName}',
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              content: index == list.length - 1
                                  ? Container(
                                      height: 300,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
                                        color: VaxConstants.cardColors[index],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text('Maker: ${vax.maker}'),
                                          Text('1st Dose: ${vax.firstDate}'),
                                          Text('2nd Dose: ${vax.secondDate}'),
                                          Text('Booster: ${vax.boosterDate}'),
                                          Center(
                                              child: SizedBox(
                                                  height: 200,
                                                  width: 200,
                                                  child: QrImageView(
                                                      data: 'Vaccinated Dates: ${vax.firstDate}, ${vax.secondDate}')))
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 20,
                                      color: VaxConstants.cardColors[index],
                                    ));
                        }, childCount: list.length),
                      ),
                    ]),
              ),
            )
          : const Center(
              child: Text(
                'No vaccines please add one',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
