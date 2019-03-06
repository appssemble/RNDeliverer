//
//  CameraContainerView.swift
//  RNDeliverer
//
//  Created by Razvan Chelemen on 05/03/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import Deliverer

@objc class CameraContainerView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        try? DelivererManager.shared.createCameraInput()
        if let cameraInput = DelivererManager.shared.cameraInput {
            addSubview(cameraInput.cameraView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for view in subviews {
            view.frame = bounds
        }
    }

}
