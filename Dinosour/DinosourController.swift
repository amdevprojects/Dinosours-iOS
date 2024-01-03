//
//  DinosourController.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import Foundation

class DinosourController {
    
    var allDinosours: [Dinosour] = []
    var dinosours: [Dinosour] = []
    let filters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeDinosoursFromJsonFile()
    }
    
    func decodeDinosoursFromJsonFile() {
        if let jsonFileUrl = Bundle.main.url(forResource: "apexpredators", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonFileUrl)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allDinosours = try decoder.decode([Dinosour].self, from: jsonData)
            } catch {
                print("Error decoding Dinosours json file: \(error)")
            }
        }
    }
    
    func filterIcon(filter: String) -> String {
        return switch filter {
        case "All": "square.stack.3d.up.fill"
        case "Land": "leaf.fill"
        case "Air": "wind"
        case "Sea": "drop.fill"
        default: "questionmark"
        }
    }
    
    func filter(filter: String) {
        switch filter {
        case "Land", "Air", "Sea": dinosours = allDinosours.filter { $0.type == filter.lowercased() }
        default: dinosours = allDinosours
        }
    }
    
    func sortAlphabetical() {
        dinosours.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovie() {
        dinosours.sort(by: { $0.id < $1.id })
    }
}
