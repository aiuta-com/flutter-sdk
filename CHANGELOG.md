# 1.0.9 - In progress

* AIUTA-3906: iOS plugin will attempt to recover the font name from the file if it is not properly configured ([#139](https://github.com/aiuta-com/flutter-sdk/pull/139))

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
