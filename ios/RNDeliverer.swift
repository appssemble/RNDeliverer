//
//  RNDeliverer.swift
//  RNDeliverer
//
//  Created by Razvan Chelemen on 28/02/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import Deliverer

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
    
    @objc(addEvent:location:)
    func addEvent(name: String, location: String) -> Void {
        // Date is ready to use!
    }
    
    @objc(setupStreamer)
    func setupStreamer() {
        DelivererManager.shared.createCameraInput()
        
        if let cameraInput = cameraInput {
            // Add camera as input to the streamer
            streamer.addInput(input: cameraInput)
            
            // Configure the streamer with the settings you gave (or default ones if none are given) settings
            do {
                try streamer.configure()
            } catch {
                print("Failed to configure streamer")
                return
            }
        }
    }
    
    @objc(startCamera)
    func startCamera() {
        // Start the camera
        cameraInput?.startCamera()
    }
    
    @objc(startEncoding)
    func startEncoding() {
        streamer.startEncoding()
    }
    
    @objc(stopEncoding)
    func stopEncoding() {
        streamer.stopEncoding()
    }
    
    @objc(addStreamingEndpoint:)
    func addStreamingEndpoint(url:String) {
        let streamingEndpoint = StreamingEndpoint(url: url)
        try! streamer.addStreamingEndpoint(endpoint: streamingEndpoint)
    }
    
    @objc(removeStreamingEndpoint:)
    func removeStreamingEndpoint(url:String) {
        let streamingEndpoint = StreamingEndpoint(url: url)
        streamer.removeStreamingEndpoint(endpoint: streamingEndpoint)
    }
    
}
