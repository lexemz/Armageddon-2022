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
    let arrivalDate: Date
    let arrivalDistance: Double
    let isDangerous: Bool
}

extension Asteroid {
    static func generateMock() -> [Self] {
        [
            Asteroid(
                name: "2021 FQ",
                diametr: 250,
                arrivalDate: Date(timeIntervalSince1970: 1655082000),
                arrivalDistance: 3321,
                isDangerous: true
            ),
            Asteroid(
                name: "2022 QQ",
                diametr: 85,
                arrivalDate: Date(timeIntervalSince1970: 1655168400),
                arrivalDistance: 112,
                isDangerous: false
            )
        ]
    }
    
}
