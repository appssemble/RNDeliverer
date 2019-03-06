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
    
    func createCameraInput() throws {
        guard cameraInput == nil else {
            return
        }
        
        cameraInput = try CameraInput.defaultCamera()
        try? cameraInput?.setResolution(sessionPresent: .iFrame1280x720)
    }
    
}
