# Aiuta Virtual Try On SDK for Flutter

This package contains
the [Virtual Try-On Solution for Apparel and Fashion Businesses](https://aiuta.com/virtual-try-on)
SDK for Flutter
as a [plug-in package](https://flutter.dev/developing-packages/), a specialized
package that includes platform-specific implementation
code for Android and/or iOS that
uses [Aiuta Digital Try On API](https://developer.aiuta.com/products/digital-try-on/Documentation).

## Permissions

### iOS

Add the following keys to your `Info.plist` file, located
in `<project root>/ios/Runner/Info.plist`:

- `NSCameraUsageDescription`: *Required* Please describe why your app needs
  access to the camera so that Aiuta can request permission
  to use the camera from the user. This is called _Privacy - Photo Library Usage
  Description_ in the visual editor.
- `NSPhotoLibraryAddUsageDescription`: _Optional_ Please describe why your app
  needs permission for the photo library so that Aiuta can request
  permission to save the generated image to the Photo Gallery from the user.
  This is called _Privacy - Camera Usage Description_ in the visual editor.

### Android

No configuration required - the plugin should work out of the box.

## Availability

### iOS

Compilation support is provided for iOS 12.0 and later. However, the SDK
requires iOS 13.0 or later to work. If the device is running an older version of
iOS, the native SDK will not be available.

Please check the availability of the SDK by calling the `isAvailable` getter on
the configured `Aiuta` object before providing the try-on functionality to the
user.

### Android

Aiuta requires `minSdkVersion = 23` or later.

## Configuration

Please see the [AiutaConfiguration](lib/configuration/aiuta_configuration.dart)
and its properties to observe the available configuration.

## Try-on

Call the `startAiutaFlow(product: AiutaProduct(...))` method on the
configured `Aiuta` object to provide virtual try-on functionality to the user.

### Product

[AiutaProduct](lib/models/product/aiuta_product.dart) represents the information
about a SKU in the Aiuta platform.

## Try-on History

Call the `startAiutaHistoryFlow()` method on the configured `Aiuta` object to
provide the user with a history of their virtual try-on generations.

## Example Usage

```

final aiuta = Aiuta(configuration: AiutaConfiguration(...));
if (await aiuta.isAvailable) {
  aiuta.startTryonFlow(product: AiutaProduct(...));
}

```

