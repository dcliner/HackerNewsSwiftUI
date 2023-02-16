//
//  ResultState.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/26/23.
//

import Foundation

enum ResultState{
    case loading
    case success(content: [Hits])
    case failed (error: Error)
}
