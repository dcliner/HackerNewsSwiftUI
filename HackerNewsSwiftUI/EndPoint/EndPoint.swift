//
//  Constants.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/24/23.
//

import Foundation
protocol APIBuilder{
    var urlRequest: URLRequest {get}
    var baseUrl: String {get}
    var path: String {get}
}
enum NewsAPI{
    case getNews
}
extension NewsAPI: APIBuilder{
    var baseUrl: String {
        switch self{
        case.getNews:
            return "https://hn.algolia.com/api/v1" }
    }
    
    var path: String {
        return "/search?tags=front_page"
    }
    

    var urlRequest: URLRequest {
        switch self{
        case .getNews:
            let url = URL(string:(self.baseUrl + self.path))!
            return URLRequest(url: url)
        }
    }
}

//enum SERVER : String {
//    case getNews = /*"https://hn.algolia.com/api/v1/search?tags=front_page"*/
//}
