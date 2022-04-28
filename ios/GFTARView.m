//
//  GFTARView.m
//  GetSafearea
//
//  Created by Seungyong Kwak on 2022/04/28.
//  Copyright © 2022 Facebook. All rights reserved.
//

#import "GFTARView.h"

// https://stackoverflow.com/questions/155964/what-are-best-practices-that-you-use-when-writing-objective-c-and-cocoa/156098#156098
@interface GFTARView ()


#pragma mark - Private Properties
@property (nonatomic, strong) ARSession* session;
@property (nonatomic, strong) ARWorldTrackingConfiguration *configuration;

@end


void dispatch_once_on_main_thread(dispatch_once_t *predicate,
                                  dispatch_block_t block) {
    if ([NSThread isMainThread]) {
        dispatch_once(predicate, block);
    } else {
        if (DISPATCH_EXPECT(*predicate == 0L, NO)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                dispatch_once(predicate, block);
            });
        }
    }
}


@implementation GFTARView
static GFTARView *instance = nil;

+ (bool)isInitialized {
    return instance !=nil;
}

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once_on_main_thread(&onceToken, ^{
        if (instance == nil) {
            ARSCNView *arView = [[ARSCNView alloc] init];
            instance = [[self alloc] initWithARView:arView];
        }
    });
    
    return instance;
}

- (instancetype)initWithARView:(ARSCNView *)arView {
    if ((self = [super init])) {
        self.arView = arView;
        
        // delegates
//        arView.delegate = self;
//        arView.session.delegate = self;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self.arView addGestureRecognizer:tapGestureRecognizer];
        
//        self.touchDelegates = [NSMutableArray array];
//        self.rendererDelegates = [NSMutableArray array];
//        self.sessionDelegates = [NSMutableArray array];
//
//        // nodeManager
//        self.nodeManager = [RCTARKitNodes sharedInstance];
//        self.nodeManager.arView = arView;
//        [self.sessionDelegates addObject:self.nodeManager];
        
        // configuration(s)
        arView.autoenablesDefaultLighting = YES;
        arView.scene.rootNode.name = @"root";
        
        #if TARGET_IPHONE_SIMULATOR
        // allow for basic orbit gestures if we're running in the simulator
        arView.allowsCameraControl = YES;
        arView.defaultCameraController.interactionMode = SCNInteractionModeOrbitTurntable;
        arView.defaultCameraController.maximumVerticalAngle = 45;
        arView.defaultCameraController.inertiaEnabled = YES;
        [arView.defaultCameraController translateInCameraSpaceByX:(float) 0.0 Y:(float) 0.0 Z:(float) 3.0];
        
        #endif
        // start ARKit
        [self addSubview:arView];
        [self resume];
    }
    return self;
}

- (void)resume {
    [self.session runWithConfiguration:self.configuration];
}

- (void)handleTapFrom: (UITapGestureRecognizer *)recognizer {
    // Take the screen space tap coordinates and pass them to the hitTest method on the ARSCNView instance
    CGPoint tapPoint = [recognizer locationInView:self.arView];
    //
    NSLog(@"tapPoint :: %@", tapPoint);
    
//    if(self.onTapOnPlaneUsingExtent) {
//        // Take the screen space tap coordinates and pass them to the hitTest method on the ARSCNView instance
//        NSDictionary * planeHitResult = [self getPlaneHitResult:tapPoint types:ARHitTestResultTypeExistingPlaneUsingExtent];
//        self.onTapOnPlaneUsingExtent(planeHitResult);
//    }
//
//    if(self.onTapOnPlaneNoExtent) {
//        // Take the screen space tap coordinates    and pass them to the hitTest method on the ARSCNView instance
//        NSDictionary * planeHitResult = [self getPlaneHitResult:tapPoint types:ARHitTestResultTypeExistingPlane];
//        self.onTapOnPlaneNoExtent(planeHitResult);
//    }
}


@end
