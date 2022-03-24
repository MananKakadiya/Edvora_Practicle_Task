//
//  CommonAPI.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import Foundation
import UIKit
import SwiftUI

@available(iOS 15.0, *)
class CommonAPI: NSObject {
    
    // A Singleton instance
    static let sharedInstance = CommonAPI()
    
    
    func callApiForGetUser(param : [String: Any]?, CompleationHandler: @escaping((Bool, String)->Void)){

        
        ServiceManager.shared().call(serviceName: API_ENDPOINT.user, parameters: param, isHudShow: true, completion: {(responseData) in
            
            if let model = try! JSONDecoder().decode(UserModel?.self, from: responseData) {
                print(model)
                
            }
        }, failure: { error in
            print(error.errorDescription as Any)
            CompleationHandler(false, "\(error.errorDescription ?? "")")
            
        })
        
        
    }
    
    
    func callAPIforGetUserDetail(){
        ServiceManager.shared().callGETApi(url: API_ENDPOINT.user) { responseData in
            if let model = try! JSONDecoder().decode(UserModel?.self, from: responseData) {
                print(model)
            }
        } failure: { error in
            print(error)
        }

       
    }
    
    func callAPIforGetRideDetail(){
        ServiceManager.shared().callGETApi(url: API_ENDPOINT.rides) { responseData in
            if let model = try! JSONDecoder().decode([RideModel]?.self, from: responseData) {
                print(model)
            }
        } failure: { error in
            print(error)
        }

       
    }
 
}
