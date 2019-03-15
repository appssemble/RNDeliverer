
# React Native Deliverer

React native wrapper for Deliverer library.
You can get the iOS library from [here](https://github.com/appssemble/Deliverer-Swift)

### Prerequisites

This is project is just the react native wrapper for Deliverer native libraries so for it to work you must integrate the native libraries in your android and iOS projects. Bellow are references on how to do this.

#### iOS
Please follow the installation instructions from [swift SDK](https://github.com/appssemble/Deliverer-Swift) to add the Deliverer SDK to your iOS project.

### Installation

After native SDKs are integrated you are ready to add the react native wrapper using one of the method below.

### Mostly automatic installation

```
$ npm install react-native-deliverer --save
$ react-native link react-native-deliverer
```

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-deliverer` and add `RNDeliverer.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDeliverer.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNDelivererPackage;` to the imports at the top of the file
  - Add `new RNDelivererPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-deliverer'
  	project(':react-native-deliverer').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-deliverer/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-deliverer')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNDeliverer.sln` in `node_modules/react-native-deliverer/windows/RNDeliverer.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Deliverer.RNDeliverer;` to the usings at the top of the file
  - Add `new RNDelivererPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNDeliverer from 'react-native-deliverer';

// TODO: What to do with the module?
RNDeliverer;
```
  
