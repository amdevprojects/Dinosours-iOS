//
//  Dinosour.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import Foundation
import SwiftUI

struct Dinosour: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        return switch type {
        case "land": .brown
        case "air": .teal
        case "sea": .blue
        default: .brown
        }
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
