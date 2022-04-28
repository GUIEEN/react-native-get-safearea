//#import "GetSafearea.h"
//#import <React/RCTLog.h>
//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//
//@implementation GetSafearea
//
//// Without passing in a name this will export the native module name as the Objective-C class name with “RCT” removed
//RCT_EXPORT_MODULE()
//
///**
// - ref: https://reactnative.dev/docs/native-modules-ios
//
// OBJECTIVE-C    JAVASCRIPT
// NSString    string, ?string
// BOOL    boolean
// NSNumber    ?boolean
// double    number
// NSNumber    ?number
// NSArray    Array, ?Array
// NSDictionary    Object, ?Object
// RCTResponseSenderBlock    Function (success)
// RCTResponseSenderBlock, RCTResponseErrorBlock    Function (failure)
// RCTPromiseResolveBlock, RCTPromiseRejectBlock    Promise
//
// The following types are currently supported but will not be supported in TurboModules. Please avoid using them.
//
// Function (failure) -> RCTResponseErrorBlock
// Number -> NSInteger
// Number -> CGFloat
// Number -> float
//*/
//
//RCT_EXPORT_METHOD(getSafeArea:
//                  (RCTPromiseResolveBlock)resolve
//                  rejecter:(RCTPromiseRejectBlock)reject)
//{
//    UIWindow* window=[[UIApplication sharedApplication] keyWindow];
//
//    NSNumber *top= [NSNumber numberWithFloat:(float)window.safeAreaInsets.top];
//    NSNumber *bottom= [NSNumber numberWithFloat:(float)window.safeAreaInsets.bottom];
//    NSNumber *right= [NSNumber numberWithFloat:(float)window.safeAreaInsets.right];
//    NSNumber *left= [NSNumber numberWithFloat:(float)window.safeAreaInsets.left];
//#if DEBUG
//    RCTLogInfo(@"[RNNotch][ios][getSafeArea] top=%f bottom=%f left=%f right=%f", top, bottom, left, right);
//#endif
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:top, @"top", bottom, @"bottom", right, @"right", left, @"left", nil];
//    resolve(dict);
//}
//
//@end

//// RNTMapManager.m
#import <MapKit/MapKit.h>

#import <React/RCTViewManager.h>

@interface RNTMapManager : RCTViewManager
@end

@implementation RNTMapManager

RCT_EXPORT_MODULE(RNTMap)

- (UIView *)view
{
  return [[MKMapView alloc] init];
}

@end

//
//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//
//#import <ARKit/ARKit.h>
//
//@interface GFTARView : UIView
//
//+ (instancetype)sharedInstance;
//+ (bool)isInitialized;
//- (instancetype)initWithARView:(ARSCNView *)arView;
//
//#pragma mark - Properties
//@property (nonatomic, strong) ARSCNView *arView;
//
//#pragma mark - Public Method
//- (void)resume;
//
//#pragma mark - Delegates
//
//@end
//// https://stackoverflow.com/questions/155964/what-are-best-practices-that-you-use-when-writing-objective-c-and-cocoa/156098#156098
//@interface GFTARView ()
//
//
//#pragma mark - Private Properties
//@property (nonatomic, strong) ARSession* session;
//@property (nonatomic, strong) ARWorldTrackingConfiguration *configuration;
//
//@end
//
//
//void dispatch_once_on_main_thread(dispatch_once_t *predicate,
//                                  dispatch_block_t block) {
//    if ([NSThread isMainThread]) {
//        dispatch_once(predicate, block);
//    } else {
//        if (DISPATCH_EXPECT(*predicate == 0L, NO)) {
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                dispatch_once(predicate, block);
//            });
//        }
//    }
//}
//
//
//@implementation GFTARView
//static GFTARView *instance = nil;
//
//+ (bool)isInitialized {
//    return instance !=nil;
//}
//
//+ (instancetype)sharedInstance {
//
//    static dispatch_once_t onceToken;
//
//    dispatch_once_on_main_thread(&onceToken, ^{
//        if (instance == nil) {
//            ARSCNView *arView = [[ARSCNView alloc] init];
//            instance = [[self alloc] initWithARView:arView];
//        }
//    });
//
//    return instance;
//}
//
//- (instancetype)initWithARView:(ARSCNView *)arView {
//    if ((self = [super init])) {
//        self.arView = arView;
//
//        // delegates
////        arView.delegate = self;
////        arView.session.delegate = self;
//
//        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
//        tapGestureRecognizer.numberOfTapsRequired = 1;
//        [self.arView addGestureRecognizer:tapGestureRecognizer];
//
////        self.touchDelegates = [NSMutableArray array];
////        self.rendererDelegates = [NSMutableArray array];
////        self.sessionDelegates = [NSMutableArray array];
////
////        // nodeManager
////        self.nodeManager = [RCTARKitNodes sharedInstance];
////        self.nodeManager.arView = arView;
////        [self.sessionDelegates addObject:self.nodeManager];
//
//        // configuration(s)
//        arView.autoenablesDefaultLighting = YES;
//        arView.scene.rootNode.name = @"root";
//
//        #if TARGET_IPHONE_SIMULATOR
//        // allow for basic orbit gestures if we're running in the simulator
//        arView.allowsCameraControl = YES;
//        arView.defaultCameraController.interactionMode = SCNInteractionModeOrbitTurntable;
//        arView.defaultCameraController.maximumVerticalAngle = 45;
//        arView.defaultCameraController.inertiaEnabled = YES;
//        [arView.defaultCameraController translateInCameraSpaceByX:(float) 0.0 Y:(float) 0.0 Z:(float) 3.0];
//
//        #endif
//        // start ARKit
//        [self addSubview:arView];
//        [self resume];
//    }
//    return self;
//}
//
//- (void)resume {
//    [self.session runWithConfiguration:self.configuration];
//}
//
//- (void)handleTapFrom: (UITapGestureRecognizer *)recognizer {
//    // Take the screen space tap coordinates and pass them to the hitTest method on the ARSCNView instance
//    CGPoint tapPoint = [recognizer locationInView:self.arView];
//    //
//    NSLog(@"tapPoint :: %@", tapPoint);
//
////    if(self.onTapOnPlaneUsingExtent) {
////        // Take the screen space tap coordinates and pass them to the hitTest method on the ARSCNView instance
////        NSDictionary * planeHitResult = [self getPlaneHitResult:tapPoint types:ARHitTestResultTypeExistingPlaneUsingExtent];
////        self.onTapOnPlaneUsingExtent(planeHitResult);
////    }
////
////    if(self.onTapOnPlaneNoExtent) {
////        // Take the screen space tap coordinates    and pass them to the hitTest method on the ARSCNView instance
////        NSDictionary * planeHitResult = [self getPlaneHitResult:tapPoint types:ARHitTestResultTypeExistingPlane];
////        self.onTapOnPlaneNoExtent(planeHitResult);
////    }
//}
//
//-(ARWorldTrackingConfiguration *)configuration {
//    if (_configuration) {
//        return _configuration;
//    }
//
//    if (!ARWorldTrackingConfiguration.isSupported) {}
//
//    _configuration = [ARWorldTrackingConfiguration new];
//    _configuration.planeDetection = ARPlaneDetectionHorizontal;
//    return _configuration;
//}
//
//- (ARSession*)session {
//    return self.arView.session;
//}
//
//@end
//
//
//#import "GetSafearea.h"
//
//@implementation RNModuleTemplateModule
//
//RCT_EXPORT_MODULE(RNTMap)
//
//- (UIView *)view {
//    return GFTARView.sharedInstance;
//}
//
//@end
