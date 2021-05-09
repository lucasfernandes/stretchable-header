//
//  Header.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct Header: View {
    var image: String
    @Binding var showHeader: Bool
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
            Image(image)
                .resizable()
                .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                .frame(height: geometry.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + geometry.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                .onReceive(self.time) { _ in
                    let y = geometry.frame(in: .global).minY
                    
                    if -y > (UIScreen.main.bounds.height / 2.2) - 50 {
                        withAnimation(.spring()) {
                            self.showHeader = true
                        }
                    } else {
                        withAnimation(.spring()) {
                            self.showHeader = false
                        }
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height / 2.2)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(image: "iphone-wallpaper", showHeader: .constant(false))
    }
}
