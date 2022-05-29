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
    let arrivalDate: String
    let arrivalDistance: Double
    let isDangerous: Bool
}

extension Asteroid {
    static func generateMock() -> [Self] {
        [
            Asteroid(
                name: "2021 FQ",
                diametr: 250,
                arrivalDate: "06-09-2022",
                arrivalDistance: 3321,
                isDangerous: true
            ),
            Asteroid(
                name: "2022 QQ",
                diametr: 85,
                arrivalDate: "20-06-2022",
                arrivalDistance: 112,
                isDangerous: false
            )
        ]
    }
}
