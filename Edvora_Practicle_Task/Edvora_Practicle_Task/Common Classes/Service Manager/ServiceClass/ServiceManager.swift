//
//  ServiceManager.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import Foundation
import UIKit

struct ServiceData: Decodable {
    var modelClass : String?
    var url : String?
    var methodType : String?
}

@available(iOS 15.0, *)

class ServiceManager: NSObject {
    
    private static var serviceManager: ServiceManager = {
        let serviceManager = ServiceManager()
        
        return serviceManager
    }()
    
    //MARK:- Initilize
    private override init(){
        
    }
    
    //MARK:- Public Methods
    class func shared() -> ServiceManager{
        return serviceManager
    }
    
    func call(serviceName : String, parameters : [String: Any]?, isHudShow : Bool, completion: @escaping (_ responseData: Data) -> (), failure: @escaping (_ error : ServiceError) -> ()){
        

            print("😎😎😎😎 API Name - \(Constants.baseURL)\(serviceName)")
            print("😎😎😎😎 <=======Parameters=======>\n \(parameters!)")

            
            //Generate URLRequest based on service name
            if let request = getRequestFor(serviceName: serviceName, parameters: parameters){
                dataTask(request: request, completion: { (data, response) in
                    if let responseData = data {
                        
                        #if DEBUG
                        self.printJSON(responseData: responseData)
                        #endif
                        
                        //Verify HTTP Response using status code
                        
                        self.validateServiceResponse(response: response, completion: { (isVlaid) in
                            
                            completion(responseData)
//                            SVProgressHUD.dismiss()
                        }, failure: { (error) in
                            DispatchQueue.main.async {
                                failure(error)
                            }
                        })
                    }
                }, failure: { (error) in
                    failure(ServiceError.createError(statusCode: .common, description: error.localizedDescription))
                })
            }
            else {
//                SVProgressHUD.dismiss()
                failure(ServiceError.createError(statusCode: .common, description: "APi Not Found"))
            }
            
       
        
    }
    func callGETApi(url: String, completion : @escaping (Data)->(), failure: @escaping (_ error : ServiceError) -> ()){
        var request = URLRequest(url: URL(string: "\(Constants.baseURL)\(url)")!)
           request.httpMethod = "GET"
           let session = URLSession.shared

           session.dataTask(with: request) {data, response, err in
               if let responseData = data {
                    #if DEBUG
                        self.printJSON(responseData: responseData)
                    #endif

                   //Verify HTTP Response using status code
                   self.validateServiceResponse(response: response, completion: { (isVlaid) in
                       
                       completion(responseData)
//                            SVProgressHUD.dismiss()
                   }, failure: { (error) in
                       DispatchQueue.main.async {
                           failure(error)
                       }
                   })
                   
               }
           }.resume()
    }
    //This method returns URLRequest object based on serviceName that you pass
    private func getRequestFor(serviceName: String, parameters : [String: Any]?) -> URLRequest? {
        if let serviceData = ServiceMapping.shared().getServiceData(name: serviceName){
            if let url = URL.init(string: Constants.baseURL + serviceData.url.asStringOrEmptyValue()){
                
                var urlRequest : URLRequest = URLRequest.init(url: url)
                urlRequest.httpMethod = serviceData.methodType.asStringOrEmptyValue()
                
                self.setReqeustHeaders(request: &urlRequest)
                //self.setBody(parameters: parameters, request: &urlRequest)
                
                let boundary = "Boundary-\(NSUUID().uuidString)"
                urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                //                urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                //urlRequest.httpBody = createBodyWithParams(parameters: parameters!, filePathKey: "file", boundary: boundary) as Data
                urlRequest.httpBody = createBodyWithParams(parameters: parameters!, boundary: boundary) as Data
                
                return urlRequest
            }
            else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    private func setReqeustHeaders( request : inout URLRequest){
        request.setValue(Constants.shared.deviceToken, forHTTPHeaderField: "deviceToken")
        request.setValue("iOS", forHTTPHeaderField: "osType")
        request.setValue(Constants.DeviceType, forHTTPHeaderField: "deviceType")
        request.setValue(Constants.shared.osVersion, forHTTPHeaderField: "osVersion")
        request.setValue(Constants.shared.appVersion, forHTTPHeaderField: "appVersion")
    }
    
    private func setBody(parameters : [String: Any]?, request : inout URLRequest) {
        
        if let requestData = parameters{
            /*
             do {
             request.httpBody = try JSONSerialization.data(withJSONObject: requestData, options: .prettyPrinted)
             } catch let error {
             print(error.localizedDescription)
             }
             */
            var dict = Dictionary<String, Any>()
            dict = requestData
            
            let postString = (dict.compactMap({ (key, value) -> String in
                return "\(key)=\(value)"
            }) as Array).joined(separator: "&")
            request.httpBody = postString.data(using: String.Encoding.utf8)
        }
    }
    
    func createBodyWithParams(parameters: [String: Any]?,boundary: String) -> NSData {
        let body = NSMutableData()
        
        if parameters != nil {
            
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
            //          MARK: UploadingMultipleImages
//            if multipleImage.count > 0 {
//                var i = 1;
//                let mimetype = MIME_TYPE.IMAGE.rawValue
//                for data in multipleImage{
//
//                    let filename = "image\(i).png"
//                    body.appendString(string: "--\(boundary)\r\n")
//                    body.appendString(string: "Content-Disposition: form-data; name=\"\(AddVehicleDetailsParam.vVehicleImages)\"; filename=\"\(filename)\"\r\n")
//                    body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
//                    body.append(data)
//                    body.appendString(string: "\r\n")
//                    i = i + 1
//                }
//            }
            
            //          MARK: UploadingProficePicture
//            if singleImage.count > 0 {
//                let mimetype = MIME_TYPE.IMAGE.rawValue //"image/png"
//                let filename = "image.png"
//                body.appendString(string: "--\(boundary)\r\n")
//                body.appendString(string: "Content-Disposition: form-data; name=\"\(SignupParam.vImage)\"; filename=\"\(filename)\"\r\n")
//                body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
//                body.append(singleImage)
//                body.appendString(string: "\r\n")
//            }
//

          
        }
        body.appendString(string: "--\(boundary)--\r\n")
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
    //MARK:- Private Methods
    private func dataTask(request: URLRequest, completion: @escaping (_ responseData: Data?,_ response : URLResponse?) -> (), failure: @escaping (_ error : Error) -> ()){
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var dataTask: URLSessionDataTask?
        dataTask = session.dataTask(with: request) { (data, response, error) in
            print("😎😎😎😎 Service HTTP response: \(String(describing: response))")
            if let serviceError = error{
                failure(serviceError)
            }else{
                completion(data, response)
            }
        }
        dataTask?.resume()
    }
    
    
    private func validateServiceResponse(response : URLResponse?, completion: @escaping (_ success: Bool) -> (), failure: @escaping (_ error: ServiceError) -> ()){
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == StatusCode.Success.rawValue {
                completion(true)
            }else{
                failure(ServiceError.createError(statusCode: StatusCode(rawValue: httpResponse.statusCode), description: "Error Message"))
            }
        }else{
            failure(ServiceError.createError(statusCode: .common, description: "Error Message"))
        }
    }
    
    
    //MARK:- Debugging methods
    func printJSON(responseData : Data){
        do {
            //let json = NSString(data: responseData, encoding: String.Encoding.utf8.rawValue)
            //print(json)
            
            if let todoJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject]{
                print("😎😎😎😎 Service response: \(todoJSON)")
                
                if let apiStatus = todoJSON["status"] as? NSNumber {
                    
                    let status = Int(truncating: apiStatus)
                    
                    if status == ApiDataStatus.CommonKeys.kIsSuccess {
                        
                        
                    }
                    else if status == ApiDataStatus.CommonKeys.kUserNotFound {
                        
                        DispatchQueue.main.async {
                                                        
//                            BaseViewController.sharedInstance.clearAllUserDataFromPreference()
//                            BaseViewController.sharedInstance.navigateToLoginScreen()
                            
                            if let msg = todoJSON["message"] as? String {
                                
                            }
                        }
                    }
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    

    
}

extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

extension Data {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}


struct ApiDataStatus {
    
    struct PaymentStatus {
        // C=>Completed / P=>Pending / R=>Rejected
        static let Pending = "P"
        static let Completed = "C"
        static let Rejected = "R"
    }
    
    struct CommonKeys {
        static let kY = "Y"
        static let kN = "N"
        static let kYes = "Yes"
        static let kNo = "No"
        static let kAuthIsSuccess = 21
        static let kIsSuccess = 1
        static let kIsFailure = 0
        static let kSocialNewUser = 2
        static let kUserNotFound = 3
        static let kEarlyRideComplete = 23
        static let kUpdateApp = 20
    }
    
    struct ApprovalSatus{
        static let Approved = "Approved"
        static let Pending = "Pending"
        static let Rejected = "Rejected"
    }

}


extension NSObject {
    func Decode<T: Decodable>(modelClass: T.Type, from inputData: Data) -> T?{
        do {
            let resultData = try JSONDecoder().decode(modelClass.self, from: inputData)
            return resultData
        } catch let message {
            print("JSON serialization error:" + "\(message)")
            return nil
        }
    }
}

//struct Loader: View {
//
//    @State private var isLoading = false
//
//    var body: some View {
//        ZStack {
//
//            Circle()
//                .stroke(Color(.systemGray5), lineWidth: 14)
//                .frame(width: 100, height: 100)
//
//            Circle()
//                .trim(from: 0, to: 0.2)
//                .stroke(Color.green, lineWidth: 7)
//                .frame(width: 100, height: 100)
//                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
//                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
//                .onAppear() {
//                    self.isLoading = true
//            }
//        }
//    }
//}

//MARK:- Optional chaining
extension Optional {
    func asStringOrEmptyValue() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
    
    func asStringOrNilValue() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return "(nil)"
        }
    }
}
