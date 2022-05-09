//
//  GFTARViewManager.m
//  GetSafearea
//
//  Created by Seungyong Kwak on 2022/05/09.
//  Copyright © 2022 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "GFTARViewManager.h"
#import "GFTARView.h"

@implementation GFTARViewManager

RCT_EXPORT_MODULE(RNTMap)

- (UIView *)view {
    return [GFTARView sharedInstance];
}

@end
