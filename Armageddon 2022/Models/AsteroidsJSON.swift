//
//  AsteroidsJSON.swift
//  NasaResponseAsteroids
//
//  Created by Igor Buzykin on 12.06.2022.
//

import Foundation

struct AsteroidsJSON: Decodable {
    
    let links: Links
    let elementCount: Int
    let nearEarthObjects: [String: [NearEarthObject]]
}

struct Links: Decodable {
    let next: String
    let prev: String
    let here: String
    
    enum CodingKeys: String, CodingKey {
        case next = "next"
        case prev = "prev"
        case here = "self"
    }
}

struct NearEarthObject: Decodable {
    let id: String
    let name: String
    let estimatedDiameter: EstimatedDiameter
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachData: [CloseApproachData]
}

struct EstimatedDiameter: Decodable {
    let meters: EstimatedMeters
}

struct EstimatedMeters: Decodable {
    let estimatedDiameterMin: Double
    let estimatedDiameterMax: Double
}

struct CloseApproachData: Decodable {
    let closeApproachDate: Date
    let missDistance: MissDistance
}

struct MissDistance: Decodable {
    let lunar: String
    let kilometers: String
}
