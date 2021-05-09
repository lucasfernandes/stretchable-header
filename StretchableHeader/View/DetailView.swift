//
//  DetailView.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 07/05/21.
//

import SwiftUI

struct DetailView: View {
    @Binding var selected: Card
    @Binding var showDetail: Bool
    var namespace: Namespace.ID
    @State var tracking = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                GeometryReader { geometry in
                    VStack(spacing: 30) {
                        Header(image: selected.image, showHeader: .constant(false))
                            .matchedGeometryEffect(id: selected.id, in: namespace)
                        
                        VStack(spacing: 5) {
                            Text(selected.title)
                                .frame(width: geometry.size.width)
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                                .matchedGeometryEffect(id: "title\(selected.id)", in: namespace)
                            Text(selected.subtitle)
                                .frame(width: geometry.size.width)
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .matchedGeometryEffect(id: "subtitle\(selected.id)", in: namespace)
                        }
                        
                        Button(action: {}, label: {
                            Text("GET")
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.primary.opacity(0.06))
                                .clipShape(Capsule())
                        })
                        .matchedGeometryEffect(id: "button\(selected.id)", in: namespace)
                        
                        Text("Some text about the app, detailing how it \nworks and whats the news about using with your iOS device")
                            .frame(height: 100)
                            .multilineTextAlignment(.center)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                    
                    }
                    .onReceive(self.tracking) { _ in
                        let y = geometry.frame(in: .global).minY
                        if y > UIScreen.main.bounds.midY / 2 {
                            withAnimation(.easeOut) {
                                showDetail = false
                            }
                        }
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color.primary.colorInvert())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selected: .constant(Card.data.first!), showDetail: .constant(false), namespace: Namespace().wrappedValue)
    }
}

struct NoButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension View {
    func delayTouches() -> some View {
        Button(action: {}) {
            highPriorityGesture(TapGesture())
        }
        .buttonStyle(NoButtonStyle())
    }
}
