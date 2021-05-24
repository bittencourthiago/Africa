//
//  VideoModel.swift
//  Africa
//
//  Created by Thiago on 24/05/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var tumbnail: String {
        "video-\(id)"
    }
}
