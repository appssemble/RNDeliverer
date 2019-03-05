//
//  DelivererManager.swift
//  RNDeliverer
//
//  Created by Razvan Chelemen on 05/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import Deliverer

class DelivererManager: NSObject {
    static let shared = DelivererManager()
    
    let streamer = Deliverer()
    var cameraInput: CameraInput?
    
    func createCameraInput() {
        guard cameraInput == nil else {
            return
        }
        
        // We use camera as input
        do {
            cameraInput = try CameraInput.defaultCamera()
        } catch let error as CameraDeviceError {
            switch error {
            case .noDevice:
                print("No device, probably you are using a simulator")
                return
            }
        } catch {
            print("Some other device error")
            return
        }
        
        try? cameraInput?.setResolution(sessionPresent: .iFrame1280x720)
    }
    
}
