//
//  CardsList.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct CardsList: View {
    @Binding var selected: Card
    @Binding var showDetail: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("All you need is here")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("See All")
                        .fontWeight(.bold)
                })
            }
            
            VStack(spacing: 20) {
                ForEach(Card.data) { card in
                    CardView(card: card, selected: $selected, showDetail: $showDetail, namespace: namespace)
                }
            }
            .padding(.top)
        }
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList(selected: .constant(Card.data.first!), showDetail: .constant(false), namespace: Namespace().wrappedValue)
    }
}
