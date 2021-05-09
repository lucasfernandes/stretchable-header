//
//  Home.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct Home: View {
    @State var showHeader = false
    @State var selected = Card.data.first!
    @State var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header(image: "iphone-wallpaper", showHeader: $showHeader)
                    CardsList(selected: $selected, showDetail: $showDetail, namespace: namespace)
                    .padding()
                    
                    Spacer()
                }
            }
            
            if self.showHeader {
                TopView()
            }
            
            if self.showDetail {
                DetailView(selected: $selected, showDetail: $showDetail, namespace: namespace)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
