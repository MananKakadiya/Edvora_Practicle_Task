//
//  Constants.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//


import UIKit
import Foundation
import SwiftUI

class Constants: NSObject {

    static let shared = Constants()

    static let baseURL = "https://assessment.api.vweb.app/"
    
    static let DeviceType = "I"
    static let currentAppVersion = 1
    
    static let AppName = "Edvora_Practicle_Task"
    
    var deviceToken = ""
    var authKey = ""
    var refreshToken = ""
    let osVersion = UIDevice.current.systemVersion
    var appVersion = "Helper().getAppVersion()"
    var appName = ""
    var firebaseDeviceToken = ""
        
    var DeviceName = ""
    var DeviceModel = "5rgrthrthrththyrtbrthtyhrthrt"
    var DeviceProcessor = ""
    var DeviceOSversion = "\(UIDevice.current.systemVersion)"
    var DeviceRAM = "\(Double(ProcessInfo.processInfo.physicalMemory) / (1024.0 * 1024.0 * 1024.0))"
    var DeviceUDID = "\("2785687968766557478685/785/*69")"
    
    var appLauguage = ""
    
   

    
    override init() {
        super.init()
        self.deviceToken = "self.getDeviceToken()"
        self.refreshToken = "self.getRefreshToken()"
        self.authKey = "self.getAutKey()"
        self.appLauguage = "Helper().getPhoneLanguage()"
        self.DeviceName = "iPhone"
        self.DeviceProcessor = ""
    }


}




public class RequestParameters {
    public class var sharedInstance: RequestParameters {
        struct Singleton {
            static let instance: RequestParameters = RequestParameters()
        }
        return Singleton.instance
    }
    
    init() {}
    
    
    func getParam() -> [String : AnyObject] {
        let param = [
            "" : "name",
        ] as [String : Any]
        
        return param as [String: AnyObject]
    }
    
}



