# react-native-pass-kit-helper

## Getting started

`$ npm install react-native-pass-kit-helper --save`

### Mostly automatic installation

`$ react-native link react-native-pass-kit-helper`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-pass-kit-helper` and add `PassKitHelper.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libPassKitHelper.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.PassKitHelperPackage;` to the imports at the top of the file
  - Add `new PassKitHelperPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-pass-kit-helper'
  	project(':react-native-pass-kit-helper').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-pass-kit-helper/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-pass-kit-helper')
  	```


## Usage
```javascript
import PassKitHelper from 'react-native-pass-kit-helper';

// TODO: What to do with the module?
PassKitHelper;
```
