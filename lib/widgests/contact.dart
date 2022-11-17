import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact_model.dart';

import './body_header_1.dart';
import './body_header_2.dart';

class Contact extends StatelessWidget {
  static const appMenuItemModelId = 'contacts';

  const Contact({super.key});

  List<Widget> contactTexts(double divHeight,
      {String addressHeader = '',
      String address = '',
      String contactHeader = '',
      String contact = ''}) {
    return [
      BodyHeader2(
        textToDisplay: addressHeader,
        bold: true,
      ),
      BodyHeader2(
        textToDisplay: address,
      ),
      SizedBox(height: divHeight),
      BodyHeader2(
        textToDisplay: contactHeader,
        bold: true,
      ),
      BodyHeader2(
        textToDisplay: contact,
      ),
    ];
  }

  Widget addressMap(String imageAssetPath) {
    return Image.asset(
      imageAssetPath,
      fit: BoxFit.fitHeight, //.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<ContactModel>(
      builder: ((context, model, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyHeader1(
                textToDisplay: model.header_1,
              ),
              Row(
                children: [
                  Expanded(
                    child: BodyHeader2(
                      textToDisplay: model.header_2,
                      bold: true,
                    ),
                  ),
                  screenSize.width > 900
                      ? const Expanded(child: SizedBox(width: 8))
                      : const SizedBox(width: 0),
                ],
              ),
              const SizedBox(height: 32),
              screenSize.width > 900
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: contactTexts(
                                64,
                                addressHeader: model.addressHeader,
                                address: model.address,
                                contactHeader: model.contactHeader,
                                contact: model.contact,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: addressMap(model.imageMap),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...contactTexts(
                          32,
                          addressHeader: model.addressHeader,
                          address: model.address,
                          contactHeader: model.contactHeader,
                          contact: model.contact,
                        ),
                        const SizedBox(height: 32),
                        addressMap(model.imageMap),
                      ],
                    ),
              const SizedBox(height: 32),
            ],
          )),
    );
  }
}
