//
//  RNDeliverer.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 28/02/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNDeliverer, NSObject)

RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location)
RCT_EXTERN_METHOD(setupStreamer)
RCT_EXTERN_METHOD(startCamera)
RCT_EXTERN_METHOD(addStreamingEndpoint:)
RCT_EXTERN_METHOD(removeStreamingEndpoint:)
RCT_EXTERN_METHOD(startEncoding)
RCT_EXTERN_METHOD(stopEncoding)

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
