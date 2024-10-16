import 'package:envied/envied.dart';

part 'env.g.dart';

/**
 * This class is used to load environment variables from the `.env` file.
 *
 * To use this class, create a `.env` file in the root of EXAMPLE project and
 * define your variables there. Example of file:
 *
 * SAMPLES_API_KEY=YOUR_API_KEY_HERE
 * SAMPLES_SUBSCRIPTION_ID=YOUR_SUBSCRIPTION_ID_HERE
 * SAMPLES_SKU_ID=YOUR_SKU_ID_HERE
 * SAMPLES_SKU_CATALOG_NAME=YOUR_SKU_CATALOG_NAME_HERE
 *
 * And then build Env class with `dart run build_runner build` command inside /example folder
 */
@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'SAMPLES_API_KEY',
    defaultValue: "YOUR_API_KEY_HERE",
  )
  static const String API_KEY = _Env.API_KEY;
  @EnviedField(
    varName: 'SAMPLES_SUBSCRIPTION_ID',
    defaultValue: "YOUR_SUBSCRIPTION_ID_HERE",
  )
  static const String SUBSCRIPTION_ID = _Env.SUBSCRIPTION_ID;
  @EnviedField(
    varName: 'SAMPLES_SKU_ID',
    defaultValue: "YOUR_SKU_ID_HERE",
  )
  static const String SKU_ID = _Env.SKU_ID;
  @EnviedField(
    varName: 'SAMPLES_SKU_CATALOG_NAME',
    defaultValue: "YOUR_SKU_CATALOG_NAME_HERE",
  )
  static const String SKU_CATALOG_NAME = _Env.SKU_CATALOG_NAME;
}
