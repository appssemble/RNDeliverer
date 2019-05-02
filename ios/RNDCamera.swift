//
//  RNCamera.swift
//  RNDeliverer
//
//  Created by Razvan Chelemen on 06/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import Deliverer
import AVFoundation

@objc(RNDCamera)
class RNDCamera: NSObject {
    private var cameraInput: CameraInput? {
        get {
            return DelivererManager.shared.cameraInput
        }
    }
    
    @objc static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc(startCamera)
    func startCamera() {
        // Start the camera
        cameraInput?.startCamera()
    }
    
    @objc(setResolution:)
    func setResolution(resolution:String) {
        var cameraResolution: AVCaptureSession.Preset? = nil
        switch resolution {
        case "640x480", "480p":
            cameraResolution = .vga640x480
        case "1280x720", "720p":
            cameraResolution = .hd1280x720
        case "1920x1080", "1080p":
            cameraResolution = .hd1920x1080
        case "3840x2160", "4k":
            cameraResolution = .hd4K3840x2160
        default:
            break
        }
        
        if let cameraResolution = cameraResolution {
            try? cameraInput?.setResolution(sessionPresent: cameraResolution)
        }
    }
    
    @objc(setPosition:)
    func setPosition(position:String) {
        var cameraPosition: AVCaptureDevice.Position? = nil
        switch position {
        case "front":
            cameraPosition = .front
        case "back":
            cameraPosition = .back
        default:
            break
        }
        
        if let cameraPosition = cameraPosition {
            try? cameraInput?.setPosition(position: cameraPosition)
        }
    }
    
    @objc(setCameraOrientation:)
    func setCameraOrientation(orientation:String) {
        var cameraOrientation: AVCaptureVideoOrientation? = nil
        
        switch orientation {
        case "portrait":
            cameraOrientation = .portrait
        case "portraitUpsideDown":
            cameraOrientation = .portraitUpsideDown
        case "landscapeRight", "landscape":
            cameraOrientation = .landscapeRight
        case "landscapeLeft":
            cameraOrientation = .landscapeLeft
        default:
            break
        }
        
        if let cameraOrientation = cameraOrientation {
            cameraInput?.setCameraOrientation(orientation: cameraOrientation)
        }
    }
    
    @objc(setStreamOrientation:)
    func setStreamOrientation(orientation:String) {
        var cameraOrientation: AVCaptureVideoOrientation? = nil
        
        switch orientation {
        case "portrait":
            cameraOrientation = .portrait
        case "portraitUpsideDown":
            cameraOrientation = .portraitUpsideDown
        case "landscapeRight", "landscape":
            cameraOrientation = .landscapeRight
        case "landscapeLeft":
            cameraOrientation = .landscapeLeft
        default:
            break
        }
        
        if let cameraOrientation = cameraOrientation {
            try? cameraInput?.setStreamOrientation(orientation: cameraOrientation)
        }
    }
    
    @objc(autorotate:)
    func autorotate(autorotate:Bool) {
        cameraInput?.autorotate = autorotate
    }
    
}
