//
//  RequestFactory.swift
//  EventApp
//
//  Created by Faris Chtatou on 23/12/22.
//

import Foundation
import UIKit

// Request Factoryprotocol
protocol RequestFactoryProtocol {
    func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest
    func getEventList(callback: @escaping ((errorType: CustomError?, errorMessage: String?), [Event]?) -> Void)
}


class RequestFactory: RequestFactoryProtocol {
    private let eventUrlStr = "https://api.airtable.com/v0/appLxCaCuYWnjaSKB/%F0%9F%93%86%20Schedule"
    
    internal func createRequest(urlStr: String, requestType: RequestType, params: [String]?) -> URLRequest {
            var url: URL = URL(string: urlStr)!
            if let params = params {
                var urlParams = urlStr
                for param in params {
                    urlParams = urlParams + "/" + param
                }
                print(urlParams)
                url = URL(string: urlParams)!
            }
        var request = URLRequest(url: url)
        request.timeoutInterval = 100
        request.httpMethod = requestType.rawValue
        let accessToken = "keymaCPSexfxC2hF9"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField:"Authorization")
        return request
    }

    func getEventList(callback: @escaping ((errorType: CustomError?,errorMessage: String?), [Event]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: eventUrlStr, requestType: .get, params: nil)) { (data, response, error) in
            
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse {
                    if responseHttp.statusCode==200 {
                        if let response = try?JSONDecoder().decode(Records.self, from: data) {
                            callback((nil, nil), response.records)
                        }
                        else {
                            callback((CustomError.parsingError, "parsing error"), nil)
                        }
                    }
                    else {
                        callback((CustomError.statusCodeError, "status code: \(responseHttp.statusCode)"), nil)
                    }
                }
            }
            else {
            callback((CustomError.requestError, error.debugDescription), nil)
            }
        }
        task.resume()
    }
}
