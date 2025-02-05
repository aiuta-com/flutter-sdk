# 1.0.19 - In progress

* AIUTA-4060: Fix image resizing on result/history screen, because of the crop in android layer

# 1.0.18

* AIUTA-3987: Fix of ConcurrentModificationException in android layer

# 1.0.17

* AIUTA-3983: Add isBackgroundExecutionAllowed feature toggle
* AIUTA-3983: Add product id to the AddGeneratedImagesAction
* AIUTA-3986: Add Aiuta.isForeground to check SDK state
* AIUTA-3982: Fix wrong product to try on
* AIUTA-3984: Fix non receiving analytics events
* AIUTA-3985: Fix Keyboard above button on feedback

# 1.0.16

* AIUTA-3951: Migrate to new initialization of SDK in android layer ([#170](https://github.com/aiuta-com/flutter-sdk/pull/170))
* AIUTA-3921: Improve feedback analytics

# 1.0.15

* AIUTA-3922: Improve analytic of feedback in android layer ([#166](https://github.com/aiuta-com/flutter-sdk/pull/166))

# 1.0.14

* AIUTA-3921: Fix session analytics events ([#162](https://github.com/aiuta-com/flutter-sdk/pull/162))

# 1.0.13

* AIUTA-3919: Consent page layout fixes ([#159](https://github.com/aiuta-com/flutter-sdk/pull/159))

# 1.0.12

* AIUTA-3919: Add optional consent footer ([#153](https://github.com/aiuta-com/flutter-sdk/pull/153))

# 1.0.11

* AIUTA-3912: Improve mapper of custom language in android layer ([#150](https://github.com/aiuta-com/flutter-sdk/pull/150))

# 1.0.10

* AIUTA-3915: Fix Wishlist button state in Product bottom sheet ([#144](https://github.com/aiuta-com/flutter-sdk/pull/144))
* AIUTA-3912: Improve feedback behaviour in Android

# 1.0.9

* AIUTA-3906: iOS plugin will attempt to recover the font name from the file if it is not properly configured ([#139](https://github.com/aiuta-com/flutter-sdk/pull/139))
* AIUTA-3641: Fix ConcurrentModificationException for data provider mode

# 1.0.8

* AIUTA-3896: Make more smooth changing of photo in loading phase in dataprovider mode

# 1.0.7

* AIUTA-3896: Make more smooth changing of photo in loading phase
* AIUTA-3892: Fix back navigation between preonboarding and onboarding screens
* AIUTA-3890: Fix serialization of external onboarding images ([#130](https://github.com/aiuta-com/flutter-sdk/pull/131))
* AIUTA-3827: Update iOS native to fix light Alert on dark iOS appearance ([#131](https://github.com/aiuta-com/flutter-sdk/pull/131))

# 1.0.6

* AIUTA-3885: Add optional consent, delete deprecated text from custom language ([#122](https://github.com/aiuta-com/flutter-sdk/pull/122))

# 1.0.5

* AIUTA-3876: Customization for tryon button, update loading status and tryon magic icon
* Add pageId and productId to all analytic events
* Make Aiuta.isAvailable check static

# 1.0.4

* AIUTA-3862: Migrate to general history image model ([#111](https://github.com/aiuta-com/flutter-sdk/pull/111))
* AIUTA-3858: Support changing all images in SDK ([#109](https://github.com/aiuta-com/flutter-sdk/pull/109))
* AIUTA-3857: Create dialog in invalid image case ([#107](https://github.com/aiuta-com/flutter-sdk/pull/107))
* AIUTA-3854: Support notification about error while deleting images from host ([#105](https://github.com/aiuta-com/flutter-sdk/pull/105))
* AIUTA-3855: Add error images state  ([#103](https://github.com/aiuta-com/flutter-sdk/pull/103))
* AIUTA-3853: Create automating changelog update ([#97](https://github.com/aiuta-com/flutter-sdk/pull/97))

# 1.0.3

* Add isShareAvailable toggle to the configuration to control the availability
  of the share button for the generated images on each step.
* Add isBlurOutlinesEnabled toggle to the theme configuration to enable or
  disable outlines for the blurred controls.

# 1.0.2

* Downgrade android dependencies to complete Flutter 3.19.6 requirements
* Move back from kotlin to groovy in build scripts

# 1.0.1

* Delete custom AiutaApplication in Android, therefore you don't need to delete
  ${applicationName} from your manifest

# 1.0.0

* Update the plugin to support the latest version of the Try-On SDK.
* Update the example app to use the latest version of the plugin.
* Update documentation with localizations and new feature toggles.
* Fix the issue with the plugin not being able to be built on Android.
* Remove obsolete localization fields from the plugin.

# 0.0.4

* Update UI for design review
* Migrate from libs catalog for solving problem with building flutter app on
  android

# 0.0.3

* Downgrade the minimum Flutter version to 3.19.6, sdk to 3.1.0.

# 0.0.2

* Add `startHistoryFlow()` method to provide the user with a history of their
  virtual try-on generations.
* Add `isAvailable` getter to check if the plugin is available.
* Some brief documentation.
* Update the example app to include the new `startHistoryFlow()` method.
* Update the example app to include a check for the plugin availability.
* More informative pubspec.yaml description & links.

# 0.0.1

* Initial development release.
