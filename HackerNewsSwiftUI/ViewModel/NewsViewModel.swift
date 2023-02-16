//
//  NewsViewModel.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/26/23.
//

import Foundation
import Combine

protocol NewsViewModel{
    func getNewsHits()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel{
        private let service: NewsService
        private(set) var hits = [Hits]()
        
        private var cancellables = Set<AnyCancellable>()
        @Published private(set) var state: ResultState = .loading
        init(service: NewsService){
            self.service = service
        }
        func getNewsHits(){
            self.state = .loading
            let cancellable = service.request(from: .getNews)
                .sink { res in
                    switch res{
                    case .finished:
                        self.state = .success(content: self.hits)
                        break
                    case .failure(let error ):
                        self.state = .failed(error: error)
                        break
                    }
                } receiveValue: { response in
                    self.hits = response.hits!
                }
            self.cancellables.insert(cancellable)

        }
}
