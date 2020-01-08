# Twinkle Button

A button plug-in that can flash.

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

Parameter | Default | Description
|:-----------:||:-----------:|:-----------:|
buttonTitle  | null | The text on the button, cannot be omitted.
buttonColor  | null | Button background color, cannot be omitted.
buttonHeight | 50.0 | Height of button.
buttonWidth  | 280.0| Width of button.
durationTime | 3    | Button blink interval.
twinkleTime  | 300  | Blink time.
onclickButtonFunction  | null | Events executed by clicking the button, cannot be omitted.