//
//  RNDNotifications.m
//  RNDeliverer
//
//  Created by Razvan Chelemen on 11/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNDNotifications.h"

#define kEndpointDidStartStreamingNotification @"endpointDidStartStreamingNotification"
#define kEndpointDidStopStreamingNotification @"endpointDidStopStreamingNotification"

@implementation RNDNotifications {
    bool hasListeners;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"EventEndpointDidStartStreaming", @"EventEndpointDidStopStreaming"];
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(endpointDidStartStreamingReceived:) name:kEndpointDidStartStreamingNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(endpointDidStopStreamingReceived:) name:kEndpointDidStopStreamingNotification object:nil];
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
    
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)endpointDidStartStreamingReceived:(NSNotification *)notification {
    NSString *url = notification.userInfo[@"url"];
    [self sendEventWithName:@"EventEndpointDidStartStreaming" body:@{@"url": url}];
}

- (void)endpointDidStopStreamingReceived:(NSNotification *)notification {
    NSString *url = notification.userInfo[@"url"];
    [self sendEventWithName:@"EventEndpointDidStopStreaming" body:@{@"url": url}];
}

@end
