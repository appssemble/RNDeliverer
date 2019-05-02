
# React Native Deliverer

React native wrapper for Deliverer library.
You can get the iOS library from [here](https://github.com/appssemble/Deliverer-Swift).

### Prerequisites

This is project is just the react native wrapper for Deliverer native libraries so for it to work you must integrate the native libraries in your android and iOS projects. Bellow are references on how to do this.

#### iOS
Please follow the installation instructions from [swift SDK](https://github.com/appssemble/Deliverer-Swift) to add the Deliverer SDK to your iOS project.
Also make sure your project is properly configured to use swift. This usually means you must create a new swift file in your project and allow the creation of the bridging header.

### Installation

After native SDKs are integrated you are ready to add the react native wrapper using one of the method below.

#### Mostly automatic installation

```
$ npm install react-native-deliverer --save
$ react-native link react-native-deliverer
```

#### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-deliverer` and add `RNDeliverer.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDeliverer.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android (TODO)

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


## Quick Start

### 1. Import required classes

```javascript

import {NativeEventEmitter, NativeModules} from 'react-native';

```

### 2. Configure the streamer

```javascript

var RNDeliverer = NativeModules.RNDeliverer;

RNDeliverer.setupStreamer((error) => {
  if (error) {
    console.error(error);
  } else {
    console.log('Successfully configured');
  }
});

```

### 3. Start the camera

```javascript

var RNDCamera = NativeModules.RNDCamera;
RNDCamera.startCamera()

```

### 4. Add a streaming endpoint

```javascript

RNDeliverer.addStreamingEndpoint('rtmp://35.167.100.26:1935/live/test', (error) => {
  if (error) {
    console.error(error);
  } else {
    console.log('Successfully added the streaming endpoint');
  }
});

```

### 5. Start the encoding

```javascript

RNDeliverer.startEncoding()

```

### 6. Add the camera view to your view hierarchy

```javascript

const RNDCameraView = requireNativeComponent("RNDCameraView")

...

  render() {
    return (
      <View style={styles.container}>
        ...
        <RNDCameraView style={ styles.wrapper } />
      </View>
    );
  }

```

### 7. Camera options

```javascript
// '480p' '720p' '1080p' '4k'
RNDCamera.setResolution('720p')

// 'front' 'back'
RNDCamera.setPosition('front')

// 'portrait' 'portraitUpsideDown' 'landscapeRight' 'landscape' 'landscapeLeft'
RNDCamera.setCameraOrientation('portrait')

// 'portrait' 'portraitUpsideDown' 'landscapeRight' 'landscape' 'landscapeLeft'
RNDCamera.setStreamOrientation('portrait')

RNDCamera.autorotate(true)

```

### 8. Adaptive bitrate
Configure adaptive bitrate

```javascript
// 'disabled' 'laidback' 'regular' 'agressive'
RNDeliverer.adaptiveBitrate('regular')

```

Get quality changes feedback

```javascript
const subscription3 = delivererEmitter.addListener(
  'EventVideoQualityChanged',
  (endpoint) => console.log(endpoint.quality)
);

const subscription4 = delivererEmitter.addListener(
  'EventAudioQualityChanged',
  (endpoint) => console.log(endpoint.quality)
);

```
