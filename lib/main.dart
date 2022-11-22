import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import './data/app_data.dart';

import './models/home_model.dart';
import './models/contact_model.dart';
import './models/about_model.dart';
import './models/services_model.dart';
import './models/app_menu_model.dart';

import './widgests/base_frame.dart';
import './pages/resource_unavailable_page.dart';
import './widgests/sliver_base_frame.dart';

import './providers/app_configuration_provider.dart';

// TODO: feature based
// TODO: analytics

Future<String> fetchCountry(String url) async {
  final response = await http.get(
    Uri.parse(url),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return jsonDecode(response.body)['country_name'] ?? '';
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to fetch country');
  }
}

void main() async {
  Logger.root.level = Level.SEVERE;
  Logger.root.onRecord.listen((record) {
    // log(record.message, name: record.loggerName);
    log('${record.level.name}: ${record.loggerName}: ${record.message}');
  });

  //define country of IP address
  // 'http://ip-api.com/json/?fields=country'
  // 'https://api.myip.com/'

  // 4c98c9ae9a7a43168321fb4a0f05cf67
  // 'https://api.ipgeolocation.io/ipgeo?apiKey=4c98c9ae9a7a43168321fb4a0f05cf67'

  // String country = await fetchCountry('https://api.myip.com/');
  // String country = await fetchCountry('http://ip-api.com/json/?fields=country');
  String country = await fetchCountry(
      'https://api.ipgeolocation.io/ipgeo?apiKey=4c98c9ae9a7a43168321fb4a0f05cf67');

  runApp(CompanyWebApp(
    country: country,
  ));
  // }
}

class CompanyWebApp extends StatelessWidget {
  final String country;

  const CompanyWebApp({super.key, required this.country});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Oswald'),
      // routes: {
      //   AboutUs.routePath: (context) => const AboutUs(),
      //   Services.routePath: (context) => const Services(),
      //   Contact.routePath: (context) => const Contact(),
      // },
      home: country == 'Russia'
          ? MultiProvider(
              providers: [
                ChangeNotifierProvider<AppConfigurationProvider>(
                  create: (_) => AppConfigurationProvider(),
                ),
                Provider<HomeModel>(
                  create: (_) => HomeModel.fromJson(
                      const JsonDecoder().convert(appHomeData)),
                ),
                Provider<AboutModel>(
                  create: (_) => AboutModel.fromJson(
                      const JsonDecoder().convert(appAboutData)),
                ),
                Provider<ServicesModel>(
                  create: (_) => ServicesModel.fromJson(
                      const JsonDecoder().convert(appServicesData)),
                ),
                Provider<ContactModel>(
                  create: (_) => ContactModel.fromJson(
                      const JsonDecoder().convert(appContactData)),
                ),
                ChangeNotifierProvider<AppMenuModel>(
                  create: (_) => AppMenuModel.fromJson(
                      const JsonDecoder().convert(appMenuData)),
                ),
              ],
              child: Consumer<AppConfigurationProvider>(
                builder: (context, appConfiguration, child) =>
                    appConfiguration.useSliverBaseFrame
                        ? const SliverBaseFrame()
                        : const BaseFrame(),
              ),
            )
          : const ResourceUnavailable(),
    );
  }
}
