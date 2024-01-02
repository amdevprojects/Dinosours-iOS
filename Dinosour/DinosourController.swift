//
//  DinosourController.swift
//  Dinosour
//
//  Created by TTNPL-3940 on 02/01/24.
//

import Foundation

class DinosourController {
    
    var dinosours: [Dinosour] = []
    
    init() {
        decodeDinosoursFromJsonFile()
    }
    
    func decodeDinosoursFromJsonFile() {
        if let jsonFileUrl = Bundle.main.url(forResource: "apexpredators", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonFileUrl)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                dinosours = try decoder.decode([Dinosour].self, from: jsonData)
            } catch {
                print("Error decoding Dinosours json file: \(error)")
            }
        }
    }
    
    func sortAlphabetical() {
        dinosours.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovie() {
        dinosours.sort(by: { $0.id < $1.id })
    }
}
