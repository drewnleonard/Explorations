//
//  ModelData.swift
//  Explorations
//
//  Created by Drew Leonard on 8/25/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var trips: [Trip] = load("tripData.json")
    
    init() {
        self.trips = load("tripData.json")
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
