//
//  CardView.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @Binding var selected: Card
    @Binding var showDetail: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(self.card.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .shadow(radius: 2)
                .matchedGeometryEffect(id: self.card.id, in: namespace)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(self.card.title)
                    .fontWeight(.bold)
                    .matchedGeometryEffect(id: "title\(card.id)", in: namespace)
                
                Text(self.card.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: "subtitle\(card.id)", in: namespace)
                
                HStack(spacing: 12) {
                    Button(action: {
                        withAnimation(.spring()) {
                            selected = self.card
                            showDetail = true
                        }
                    }, label: {
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    })
                    .matchedGeometryEffect(id: "button\(card.id)", in: namespace)
                    
                    Text("In-App Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.data.first!, selected: .constant(Card.data.first!), showDetail: .constant(false), namespace: Namespace().wrappedValue)
    }
}
