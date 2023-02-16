//
//  ErorStateView.swift
//  HackerNewsSwiftUI
//
//  Created by Derefaa Cline on 1/26/23.
//

import SwiftUI


struct ErrorStateView: View {
    
    
    typealias ErrorViewActionHandler = () -> Void
    let error:Error
    let handler : ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping ErrorStateView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    var body: some View {
        VStack{
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Oooppss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .padding(.bottom, 4)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            Button (action: {
               handler()
            }, label: {
                Text("Retry")
            }).padding(.vertical, 12)
                .padding(.horizontal,30)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .heavy))
                .cornerRadius(10)
            

        }
    }
}

struct ErrorStateView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorStateView(error: APIError.decodingError){}
            .previewLayout(.sizeThatFits)
    }
}
