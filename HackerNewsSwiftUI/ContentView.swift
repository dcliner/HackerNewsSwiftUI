//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/24/23.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        Group{
            switch viewModel.state{
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorStateView(error: error, handler: viewModel.getNewsHits)
            case .success(let hits):
                NavigationView{
                    List(hits){ item in
                        NewsView(hits: item)
                            .onTapGesture {
                                load(url: item.url)
                                print(item.url)
                            }
                    }
                    .navigationTitle(Text("Hacker news"))
                }
            
            }
        }.onAppear(perform: viewModel.getNewsHits)
        }
    func load(url: String?) {
        guard let link  = url,
              let url = URL(string: link) else {return }
        openUrl(url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
