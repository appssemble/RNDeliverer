//
//  RNCameraView.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 04/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "React/RCTViewManager.h"
#import "RNDeliverer-Swift.h"

@interface RNCameraViewManager: RCTViewManager
@end

@implementation RNCameraViewManager

RCT_EXPORT_MODULE()

- (UIView *) view {
    CameraContainerView *view = [[CameraContainerView alloc] init];
    
    UILabel *label = [UILabel new];
    label.text = @"bleee";
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor blueColor];
    
    view.frame = CGRectMake(0, 0, 300, 300);
    label.frame = view.bounds;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //[view addSubview:label];
    
    return view;
}

@end
