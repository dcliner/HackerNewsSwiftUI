//
//  ApiHandler.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/24/23.
//

import Foundation
import Combine

protocol NewsService{
    func request(from endpoint: NewsAPI)-> AnyPublisher<NewsResponse, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        print(endpoint.urlRequest.url?.absoluteString)
         return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap{data, response -> AnyPublisher<NewsResponse, APIError>in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode){
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: JSONDecoder())
                        .mapError {_ in APIError.decodingError}
                        .eraseToAnyPublisher()
                }else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

/*
   // @Published var news = [Hits]()
   // var objNewsVC = NewsVC()
    /// GET API RESPONSIBLE FOR FETCHING DATA FROM SERVER
    func getNewsFrom(url:String, closure: @escaping (NewsResponse) -> ()) {
        
        guard let serverURL = URL(string: url) else {
            print("Server url is not correct , kindly recheck")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            
            
            guard let data = data else {
                print("unable to fetch data from server , encountered error )")
                return
            }
            
            
            do {
                
                let newsmodel = try JSONDecoder().decode(NewsResponse.self, from: data)
                //return data
                closure(newsmodel)
            } catch {
                print(error)
            }
            
           
            
        }.resume()
        
    }
    
    
    func getNewsUsingCombineFrom(url:String) -> AnyPublisher<NewsResponse,Error> {
        
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data }
        .decode(type: NewsResponse.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
*/


