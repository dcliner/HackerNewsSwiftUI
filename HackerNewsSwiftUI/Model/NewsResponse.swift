//
//  NewsModel.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/24/23.
//

import Foundation

struct NewsResponse : Codable {
    var hits : [Hits]?
}


struct Hits : Codable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID    : String
    var title       : String?
    var url         : String?
    var points      : Int?
}

extension Hits{
    static var dummyData: Hits{
        .init(
              objectID: "Num 1",
              title: "Show HN: I've built a C# IDE, Runtime, and AppStore inside Excel",
              url: "https://querystorm.com/csharp-in-excel/",
              points: 555)
    }
    
}
