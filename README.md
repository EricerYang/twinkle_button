# Twinkle Button

A button plug-in that can flash.

<div align=center>
    <img src='twinkle_button.gif' width='350'>
</div>

## Installation

Add dependency to pubspec.yaml

```bash
dependencies:
  ...
  twinkle_button: ^lastest_version
```

Run in your terminal

```bash
flutter packages get
```

## How to use

```dart
import 'package:twinkle_button/twinkle_button.dart';
```

```dart
TwinkleButton(
  buttonTitle: Text(
    'Subscribe with Free Trial',
    style: TextStyle(
      color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 17.0,
        ),
    ),
    buttonColor: Color(0xff3dce89),
    onclickButtonFunction: () {
      print('hello');
    }
);

```

## Attribute

| Parameter  | Default   | Description |
| :------------ |:---------------:| :-----|
| buttonTitle | null  | Change this value if you what to put pagination in other placeThe text on the button, cannot be omitted. |
| buttonColor | null | Button background color, cannot be omitted. |
| buttonHeight | 50.0 | Height of button. |
| buttonWidth | 200.0 | Width of button. |
| durationTime | 3 | Button blink interval. |
| twinkleTime | 300 | Blink time. |
| onclickButtonFunction | null | Events executed by clicking the button, cannot be omitted. |
