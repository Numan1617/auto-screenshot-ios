//
//  OneSkyHelper.h
//  OneSkyClientSDK
//
//  Created by Bret Cheng on 2/10/13.
//  Copyright (c) 2013 OneSky Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/////////////////////////////////////////////////////////////////////////////////////
/** OneSkyScreenshotHelper captures screenshot and localizable strings
 in a view controller when it appears and upload the data to OneSky server for
 the client via platform Id & key.
 
 This helper supports native/custom container view controller and
 view controllers that follow the one-VC-per-screen rule. Most of
 UIView subclasses that contain text elements are supported. Custom string drawing
 is not supported at the moment.
 */
@interface OneSkyScreenshotHelper : NSObject 

/**
 Shared instance of the helper
 */
+ (id)sharedHelper;

/**
 Start session for the given projectId, apiKey and apiSecret
 @warning projectId, apiKey and apiSecret must be set before calling this method
 */
- (void)startSession;

/**
 The project Id can be found under all projects page
 */
@property (nonatomic, strong) NSString* projectId;

/**
  The API key can be found in Site Settings under API Keys & Usage on OneSky Web Admin
 */
@property (nonatomic, strong) NSString* apiKey;

/**
 The API secret can be found in Site Settings under API Keys & Usage on OneSky Web Admin
 */
@property (nonatomic, strong) NSString* apiSecret;

/** Shows capture status ui
 */
@property (nonatomic) BOOL showsCaptureStatus;

@end
