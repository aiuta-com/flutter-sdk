# 1.0.2

* Downgrade android dependencies to complete Flutter 3.19.6 requirements
* Move back from kotlin to groovy in build scripts

# 1.0.1

* Delete custom AiutaApplication in Android, therefore you don't need to delete ${applicationName} from your manifest

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
