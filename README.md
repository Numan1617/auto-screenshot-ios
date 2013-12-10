OneSky Auto Screenshot Library for iOS
======================================

This library automatically uploads screenshots of your app that contains localizable strings to your OneSky project.

**NOTE:** This library is **not designed for distribution** on App Store, remember to **remove** before submission.

Installation
------------

1. Locate ```OneSkyScreenshotHelper.framework``` in the example project and drag the folder into the **Frameworks** section of your **Project Navigator**.
2. Make sure ```CoreGrahpics.framework``` is also added to your app's target.
3. Under **Build Settings** of the target, add ```-ObjC``` to **Other Linker Flags** setting.

Integration
-----------

Import the library header

```objective-c
	#import <OneSkyScreenshotHelper/OneSkyScreenshotHelper.h>
```

Add the following code in under ```-application:didFinishLaunchingWithOptions:``` in your app delegate:

```objective-c
    [[OneSkyScreenshotHelper sharedHelper] setProjectId:ONESKY_PROJECT_ID];
    [[OneSkyScreenshotHelper sharedHelper] setApiKey:ONESKY_API_KEY];
    [[OneSkyScreenshotHelper sharedHelper] setApiSecret:ONESKY_API_SECRET];
    
    [[OneSkyScreenshotHelper sharedHelper] startSession];
```

```ONESKY_API_KEY```, ```ONESKY_API_SECRET``` can be found in **Site Settings** under **API Keys & Usage** on **OneSky Web Admin**. 
```ONESKY_PROJECT_ID``` can be found under **All Projects** page.

**NOTE:** The above parameters must be set before calling ```-startSession```.

Advance Settings
----------------

Turn off capture status ui.
```objective-c
	[[OneSkyScreenshotHelper sharedHelper] setShowsCatpureStatus:NO];
```

If you want to capture screenshots manually, add the following line. A capture button will be added to the window.
```objective-c
	[[OneSkyScreenshotHelper sharedHelper] setAutoCaptures:NO];
```

The default position of the screenshot button is bottom right of the main window, you can adjust using ```UIViewContentMode```.
```objective-c
	@property (nonatomic) UIViewContentMode captureButtonPosition;
```

Support
-------
http://support.oneskyapp.com/
