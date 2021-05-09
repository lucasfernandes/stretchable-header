//
//  Card.swift
//  StretchableHeader
//
//  Created by Lucas Silveira on 06/05/21.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var subtitle: String
}

extension Card {
    static var data = [
        Card(image: "AppStore", title: "App Store", subtitle: "Find your apps"),
        Card(image: "Calendar", title: "Calendar", subtitle: "Keep tracking your meetings"),
        Card(image: "Connect", title: "Connect", subtitle: "Upload your apps to App Store"),
        Card(image: "Files", title: "Files", subtitle: "Track your own files"),
        Card(image: "FindMy", title: "Find My", subtitle: "Lost your phone?"),
        Card(image: "Home", title: "Home", subtitle: "Home app automation"),
        Card(image: "Light", title: "Light", subtitle: "Camera light for darkst hours"),
        Card(image: "Music", title: "Music", subtitle: "Listen your favorite songs"),
        Card(image: "Photos", title: "Photos", subtitle: "See all your photos in one place"),
    ]
}
