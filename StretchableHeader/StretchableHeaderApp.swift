//
//  StretchableHeaderApp.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import SwiftUI

@main
struct StretchableHeaderApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
//            DragGestureView()
        }
    }
}

struct DragGestureView: View {
    @State var isDragging = false

    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }

    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(drag)
    }
}
