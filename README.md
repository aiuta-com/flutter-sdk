# Aiuta Digital Try On SDK for Flutter

This repo contains the [Aiuta Digital Try On](https://developer.aiuta.com/products/digital-try-on/Documentation) flutter library 
as a [plug-in package](https://flutter.dev/developing-packages/), a specialized package that includes platform-specific implementation 
code for Android and/or iOS.

## Installation

TBD

## Permissions

### iOS

Add the following keys to your `Info.plist` file, located in `<project root>/ios/Runner/Info.plist`:

- `NSCameraUsageDescription`: *Required* Please describe why your app needs access to the camera so that Aiuta can request permission 
to use the camera from the user. This is called _Privacy - Photo Library Usage Description_ in the visual editor.
- `NSPhotoLibraryAddUsageDescription`: _Optional_ Please describe why your app needs permission for the photo library so that Aiuta can request 
permission to save the generated image to the Photo Gallery from the user. This is called _Privacy - Camera Usage Description_ in the visual editor.

### Android

No configuration required - the plugin should work out of the box.

## Usage

### Configuration

TBD Please see the `lib/configuration/aiuta_configuration.dart` and its imports to observe the available configuration.

### Try-on

Call the `startAiutaFlow(AiutaProduct)` method on the configured `Aiuta` object to provide virtual try-on functionality to the user.

### Product

`lib/models/product/aiuta_product.dart` represents the information about a SKU in the Aiuta platform.

#### Properties

- `skuId: String`: A unique identifier for the SKU.
- `catalogName: String`: The catalog identifier the SKU belongs to. It is recommended not to specify a skuCatalog unless it is explicitly necessary.
- `imageUrls: List<String>`: A list of URLs pointing to the images of the SKU.
- `title: String`: The title of the SKU.
- `brand: String`: The brand of the SKU.
- `localizedPrice: String?`: The price of the SKU. Should be formatted with a currency symbol.
- `localizedOldPrice: String?`: The old price of the SKU, if available. Should be formatted with a currency symbol.
- `additionalShareInfo: String?`: Additional information that will be passed to the share along with the generated image.
- `inWishlist: bool`: Indicates whether this item is on the user's wish list to display this status correctly.

## Example Usage

```dart

final aiuta = Aiuta(configuration: AiutaConfiguration(...));
aiuta.startTryonFlow(product: AiutaProduct(...));

```

