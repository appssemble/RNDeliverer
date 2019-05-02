//
//  RNDeliverer.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 28/02/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNDeliverer, NSObject)

RCT_EXTERN_METHOD(setupStreamer:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(addStreamingEndpoint:(NSString *)url completion:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(removeStreamingEndpoint:)
RCT_EXTERN_METHOD(startEncoding)
RCT_EXTERN_METHOD(stopEncoding)
RCT_EXTERN_METHOD(adaptiveBitrate:)

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
