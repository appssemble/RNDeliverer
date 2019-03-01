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
    static let deliverer = Deliverer.Deliverer()
    
    @objc(addEvent:location:)
    func addEvent(name: String, location: String) -> Void {
        // Date is ready to use!
    }
    
}
