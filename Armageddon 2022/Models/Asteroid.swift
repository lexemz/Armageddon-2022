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
                name: "QQ 2022",
                diametr: 500,
                arrivalDate: "06-09-2022",
                arrivalDistance: 3321,
                isDangerous: true
            ),
            Asteroid(
                name: "QC 2021",
                diametr: 300,
                arrivalDate: "20-06-2022",
                arrivalDistance: 112,
                isDangerous: false
            )
        ]
    }
}
