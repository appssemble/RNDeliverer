//
//  RNCameraView.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 04/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "React/RCTViewManager.h"
#import "RNDeliverer-Swift.h"

@interface RNDCameraViewManager: RCTViewManager
@end

@implementation RNDCameraViewManager

RCT_EXPORT_MODULE()

- (UIView *) view {
    CameraContainerView *view = [CameraContainerView new];
    
    return view;
}

@end
