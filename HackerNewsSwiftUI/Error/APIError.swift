//
//  APIError.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/25/23.
//

import Foundation

enum APIError:Error{
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError{
    var errorDescription: String?{
        switch self{
        case.decodingError:
            return "Failed to decode the object from the server"
        case.errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
    
}
