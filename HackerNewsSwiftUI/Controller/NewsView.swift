//
//  NewsView.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/26/23.
//

import SwiftUI

struct NewsView: View {
    let hits: Hits
    var body: some View {
        HStack{
            Text(String(hits.points ?? 0))
            Text(hits.title ?? "").foregroundColor(.black)
                .font(.system(size: 12, weight: .semibold))
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(hits: Hits.dummyData).previewLayout(.sizeThatFits)
    }
}
