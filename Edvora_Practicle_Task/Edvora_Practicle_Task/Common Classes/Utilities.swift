//
//  Utilities.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import Foundation
import SwiftUI

class Utilities: NSObject {
    class func setFontSize(size: CGFloat) -> CGFloat {
        if DEVICE.IS_IPHONE {
            return size
        }else if DEVICE.IS_IPAD {
            return size + 5
        }
        return size
    }
    class func setSize(size: CGFloat) -> CGFloat {
        if DEVICE.IS_IPHONE {
            return size
        }else if DEVICE.IS_IPAD {
            return size * 1.7
        }
        return size
    }
    
}
