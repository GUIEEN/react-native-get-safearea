//
//  GFTARView.h
//  GetSafearea
//
//  Created by Seungyong Kwak on 2022/04/28.
//  Copyright © 2022 Facebook. All rights reserved.
//

#import <ARKit/ARKit.h>

@interface GFTARView : UIView

+ (instancetype)sharedInstance;
+ (bool)isInitialized;
- (instancetype)initWithARView:(ARSCNView *)arView;

#pragma mark - Properties
@property (nonatomic, strong) ARSCNView *arView;

#pragma mark - Public Method
- (void)resume;

#pragma mark - Delegates

@end
