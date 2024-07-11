# react-native-pass-kit-helper

> ### Important!
>This method requires a special entitlement issued by Apple. If the entitlement is not present, the request will fail. For more information, see [Apple Developer - Apple Pay](https://developer.apple.com/apple-pay/).

## Getting started

`$ yarn add react-native-pass-kit-helper`

### Mostly automatic installation React-Native <0.60.0

`$ react-native link react-native-pass-kit-helper`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-pass-kit-helper` and add `PassKitHelper.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libPassKitHelper.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import PassKitHelper from 'react-native-pass-kit-helper';

// to suppress apple pay

if (Platform.OS === "ios") {
  PassKitHelper.suppressApplePay((result) => {
    switch (result) {
      case 0:
        console.log(
          "Apple pay automatic presentation suppression not supported"
        );
        break;
      case 1:
        console.log("Apple pay automatic presentation already suppressed");
        break;
      case 2:
        console.log("Apple pay automatic presentation suppression denied");
        break;
      case 3:
        console.log("Apple pay automatic presentation suppression cancelled");
        break;
      case 4:
        console.log("Apple pay automatic presentation suppressed successfully");
        break;
      default:
        console.log("Unknown result");
    }
  });
}

// to enable apple pay

if (Platform.OS === "ios") {
  PassKitHelper.enableApplePay((result) => {
    switch (result) {
      case 0:
        console.log("iOS level under 9 (not supported)");
        break;
      case 1:
        console.log("Apple pay presentation already enabled");
        break;
      case 2:
        console.log("Apple pay not supported");
        break;
      case 3:
        console.log("Apple pay automatic presentation activated");
        break;
      default:
        console.log("Unknown result");
    }
  });
}


```