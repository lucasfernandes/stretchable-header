//
//  BlurBackground.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

struct BlurBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // not implemented
    }
}
