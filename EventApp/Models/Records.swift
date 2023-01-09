//
//  Records.swift
//  EventApp
//
//  Created by Faris Chtatou on 23/12/22.
//

import UIKit


import Foundation

struct Records: Codable {
    var records: [Event]?
}

struct Event: Codable, Identifiable {
    var id: String
    var createdTime: String
    var fields : Fields
}

struct Fields: Codable {
    var Start: String
    var End: String
    var Activity: String
    var type: String
    var speakers: [String]?
    var Location: String
    var Notes: String?
    
    
    enum CodingKeys: String, CodingKey {
        case Start
        case End
        case Activity
        case Location
        case Notes
        case type = "Type"
        case speakers = "Speaker(s)"
    }
    
    
    func getStartDate() -> (String, String) {
        return getStringToDate(strDate: Start)
    }
    
    func getEndDate() -> (String, String) {
        return getStringToDate(strDate: End)
    }
    
    private func getStringToDate(strDate: String) -> (String, String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: strDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "dd MMM, yyyy"
        
        let dateString = convertDateFormatter.string(from: date!)
        
        let convertTimeFormatter = DateFormatter()
        convertTimeFormatter.dateFormat = "h:mm a"

        let timeString = convertTimeFormatter.string(from: date!)
        
        return (dateString, timeString)
    }
}


struct ErrorResponse: Codable {
    let error: String
}

enum RequestType: String {
    case get = "GET"
}

enum CustomError: Error {
    case requestError
    case statusCodeError
    case parsingError
}
