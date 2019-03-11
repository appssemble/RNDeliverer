//
//  RNDeliverer.swift
//  RNDeliverer
//
//  Created by Razvan Chelemen on 28/02/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import Deliverer

extension Notification.Name {
    static let endpointDidStartStreamingNotification = Notification.Name("endpointDidStartStreamingNotification")
    static let endpointDidStopStreamingNotification = Notification.Name("endpointDidStopStreamingNotification")
}

@objc(RNDeliverer)
class RNDeliverer: NSObject {
    private var streamer: Deliverer {
        get {
            return DelivererManager.shared.streamer
        }
    }
    private var cameraInput: CameraInput? {
        get {
            return DelivererManager.shared.cameraInput
        }
    }
    
    @objc static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc(setupStreamer:)
    func setupStreamer(completion:RCTResponseSenderBlock) {
        // We use camera as input
        do {
            try DelivererManager.shared.createCameraInput()
        } catch let error as CameraDeviceError {
            switch error {
            case .noDevice:
                completion([RCTMakeError("No device, probably you are using a simulator", nil, nil)])
                return
            }
        } catch {
            completion([RCTMakeError("Some other device error", nil, nil)])
            return
        }
        
        if let cameraInput = cameraInput {
            // Add camera as input to the streamer
            streamer.addInput(input: cameraInput)
            
            // Configure the streamer with the settings you gave (or default ones if none are given) settings
            do {
                try streamer.configure()
            } catch {
                completion([RCTMakeError("Failed to configure streamer", nil, nil)])
                return
            }
            
            completion([NSNull()])
        } else {
            completion([RCTMakeError("Failed to configure streamer", nil, nil)])
        }
    }
    
    @objc(startEncoding)
    func startEncoding() {
        streamer.startEncoding()
    }
    
    @objc(stopEncoding)
    func stopEncoding() {
        streamer.stopEncoding()
    }
    
    @objc(addStreamingEndpoint:completion:)
    func addStreamingEndpoint(url:String, completion:RCTResponseSenderBlock) {
        let streamingEndpoint = StreamingEndpoint(url: url)
        
        do {
            streamingEndpoint.delegate = self
            try streamer.addStreamingEndpoint(endpoint: streamingEndpoint)
            completion([NSNull()])
        } catch {
            completion([RCTMakeError("Failed to add the streaming endpoint, please check your URL.", nil, nil)])
        }
    }
    
    @objc(removeStreamingEndpoint:)
    func removeStreamingEndpoint(url:String) {
        let streamingEndpoint = StreamingEndpoint(url: url)
        streamer.removeStreamingEndpoint(endpoint: streamingEndpoint)
        streamingEndpoint.delegate = nil
    }
    
}

extension RNDeliverer: StreamingEndpointDelegate {
    
    func endpointDidStartStreaming(endpoint: StreamingEndpoint) {
        NotificationCenter.default.post(name: .endpointDidStartStreamingNotification, object: nil, userInfo: ["url":endpoint.url])
    }
    
    func endpointDidStopStreaming(endpoint: StreamingEndpoint) {
        NotificationCenter.default.post(name: .endpointDidStopStreamingNotification, object: nil, userInfo: ["url":endpoint.url])
    }
    
}
