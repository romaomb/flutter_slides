## [0.0.1] - 04-12-2019

* Initial release with the basic package.

## [0.0.2] - 04-12-2019

* Auto-format to improve package health.
* Downgrade Dart version to `2.5.0`.

## [0.0.3] - 04-12-2019

* Change SlideProvider to use `inheritFromWidgetOfExactType` as it is not
deprecated yet on stable channel.

## [0.0.4] - 04-12-2019

* Fix typos.

## [0.0.5] - 07-12-2019

* Add Windows support.
* Remove SlideSwipeBehavior, allowing both behaviors simultaneously.
* Add `SlideKeys` to map next and previous keys for each platform.

## [0.0.6] - 08-12-2019

* Expose `titleFontSize` on `SlideBase`.
* Add condition to allow a slide without body when `bodyFlex = 0` is passed on the slide's constructor.

## [0.0.7] - 08-12-2019

* Change return type of `title` in `SlideBase` to allow users to create any kind of widget.
* Expose `SlideTitle` to keep accessible the old title widget.

## [0.0.8] - 08-12-2019

* Create `SlideTransitionType` to set the transition for each slide.

## [0.0.9] - 18-12-2019

* Add WEB support (thanks to @marceloneppel).

## [0.0.10] - 03-03-2020

* Change `Navigator.isInitialRoute` to `window.defaultRouteName` due to the removal of the property
on the new Navigator 2.0