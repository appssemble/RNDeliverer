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

#define kDidChangeVideoQualityNotification @"didChangeVideoQualityNotification"
#define kDidChangeAudioQualityNotification @"didChangeAudioQualityNotification"

@implementation RNDNotifications {
    bool hasListeners;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"EventEndpointDidStartStreaming", @"EventEndpointDidStopStreaming", @"EventVideoQualityChanged", @"EventAudioQualityChanged"];
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(endpointDidStartStreamingReceived:) name:kEndpointDidStartStreamingNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(endpointDidStopStreamingReceived:) name:kEndpointDidStopStreamingNotification object:nil];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChangeVideoQualityReceived:) name:kDidChangeVideoQualityNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didChangeAudioQualityReceived:) name:kDidChangeAudioQualityNotification object:nil];
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

- (void)didChangeVideoQualityReceived:(NSNotification *)notification {
    NSString *quality = notification.userInfo[@"quality"];
    [self sendEventWithName:@"EventVideoQualityChanged" body:@{@"quality": quality}];
}

- (void)didChangeAudioQualityReceived:(NSNotification *)notification {
    NSString *quality = notification.userInfo[@"quality"];
    [self sendEventWithName:@"EventAudioQualityChanged" body:@{@"quality": quality}];
}

@end
