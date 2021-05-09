//
//  TopView.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct TopView: View {
    let top = UIApplication.shared.windows.first?.safeAreaInsets.top
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Image(systemName: "applelogo")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                    
                    Text("Awesome")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("Choose yours right now and install.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {}, label: {
                Text("Try It Free")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
        }
        .padding(.top, self.top == 0 ? 15 : self.top)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBackground())
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
