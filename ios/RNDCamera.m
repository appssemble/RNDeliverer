//
//  RNCamera.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 06/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNDCamera, NSObject)

RCT_EXTERN_METHOD(startCamera)
RCT_EXTERN_METHOD(setResolution:)
RCT_EXTERN_METHOD(setPosition:)
RCT_EXTERN_METHOD(setOrientation:)

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
