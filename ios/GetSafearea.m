#import "GetSafearea.h"
#import <React/RCTLog.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation GetSafearea

// Without passing in a name this will export the native module name as the Objective-C class name with “RCT” removed
RCT_EXPORT_MODULE()

/**
 - ref: https://reactnative.dev/docs/native-modules-ios
 
 OBJECTIVE-C    JAVASCRIPT
 NSString    string, ?string
 BOOL    boolean
 NSNumber    ?boolean
 double    number
 NSNumber    ?number
 NSArray    Array, ?Array
 NSDictionary    Object, ?Object
 RCTResponseSenderBlock    Function (success)
 RCTResponseSenderBlock, RCTResponseErrorBlock    Function (failure)
 RCTPromiseResolveBlock, RCTPromiseRejectBlock    Promise
 
 The following types are currently supported but will not be supported in TurboModules. Please avoid using them.

 Function (failure) -> RCTResponseErrorBlock
 Number -> NSInteger
 Number -> CGFloat
 Number -> float
*/

RCT_EXPORT_METHOD(getSafeArea:
                  (RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    UIWindow* window=[[UIApplication sharedApplication] keyWindow];

    NSNumber *top= [NSNumber numberWithFloat:(float)window.safeAreaInsets.top];
    NSNumber *bottom= [NSNumber numberWithFloat:(float)window.safeAreaInsets.bottom];
    NSNumber *right= [NSNumber numberWithFloat:(float)window.safeAreaInsets.right];
    NSNumber *left= [NSNumber numberWithFloat:(float)window.safeAreaInsets.left];
#if DEBUG
    RCTLogInfo(@"[RNNotch][ios][getSafeArea] top=%f bottom=%f left=%f right=%f", top, bottom, left, right);
#endif
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:top, @"top", bottom, @"bottom", right, @"right", left, @"left", nil];
    resolve(dict);
}

@end
