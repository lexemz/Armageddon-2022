//
//  Asteroid.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation

struct Asteroid {
    let name: String
    let diametr: Double
    let arrivalDate: Date?
    let arrivalDistance: AsteroidArrivarDistance
    let isDangerous: Bool
}

struct AsteroidArrivarDistance {
    let kilometers: Double
    let lunar: Double
}

extension Asteroid {
    static func generateMock() -> [Self] {
        [
            Asteroid(
                name: "2021 FQ",
                diametr: 250,
                arrivalDate: Date(timeIntervalSince1970: 1655082000),
                arrivalDistance: AsteroidArrivarDistance(kilometers: 132, lunar: 324),
                isDangerous: true
            ),
            Asteroid(
                name: "2022 QQ",
                diametr: 85,
                arrivalDate: Date(timeIntervalSince1970: 1655168400),
                arrivalDistance: AsteroidArrivarDistance(kilometers: 132, lunar: 324),
                isDangerous: false
            )
        ]
    }
    
//    init(nearEarthObject: NearEarthObject) {
//        let maxDiametr = nearEarthObject.estimatedDiameter.meters.estimatedDiameterMax
//        let minDiametr = nearEarthObject.estimatedDiameter.meters.estimatedDiameterMin
//        let avgDiametr = (maxDiametr + minDiametr) / 2
//        
//        self.init(
//            name: nearEarthObject.name,
//            diametr: avgDiametr,
//            arrivalDate: nearEarthObject.closeApproachData.first?.closeApproachDate,
//            arrivalDistance: nearEarthObject.,
//            isDangerous: nearEarthObject.isPotentiallyHazardousAsteroid
//        )
//    }
}
