OneSky Auto Screenshot Library for iOS
======================================

This library automatically uploads screenshots of your app that contains localizable strings to your OneSky project.

**NOTE:** This library is **not designed for distribution** on App Store, remember to **remove** before submission.

Demo video: http://vimeo.com/91641592

Installation
------------

1. Locate ```OneSkyScreenshotHelper.framework``` in the example project and drag the folder into the **Frameworks** section of your **Project Navigator**.
2. Make sure ```CoreGrahpics.framework``` is also added to your app's target.
3. Under **Build Settings** of the target, add ```-ObjC``` to **Other Linker Flags** setting.

Integration
-----------

Import the library header

``` objective-c
#import <OneSkyScreenshotHelper/OneSkyScreenshotHelper.h>
```

Add the following code in under ```-application:didFinishLaunchingWithOptions:``` in your app delegate:

``` objective-c
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
``` objective-c
[[OneSkyScreenshotHelper sharedHelper] setShowsCatpureStatus:NO];
```

Ignore specific strings files e.g. strings resources from 3rd-party libraries.
``` objective-c
[[OneSkyScreenshotHelper sharedHelper] setIgnoredStringsFiles:@[@"InfoPlist.strings"]];
```

Helpful articles
-------
[ How to find API key ](http://support.oneskyapp.com/solution/categories/74754/folders/150388/articles/89104-how-to-find-your-api)

Support
-------
http://support.oneskyapp.com/
