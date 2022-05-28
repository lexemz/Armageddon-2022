//
//  AsteroidViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation

protocol AsteroidViewModelType {
    var name: String { get }
    var diametr: Double { get }
    var arrivalDate: String { get }
    var arrivalDistance: Double { get }
    var isDangerous: Bool { get }
}

class AsteroidViewModel: AsteroidViewModelType {
    var name: String {
        asteroid.name
    }
    
    var diametr: Double {
        asteroid.diametr
    }
    
    var arrivalDate: String {
        asteroid.arrivalDate
    }
    
    var arrivalDistance: Double {
        asteroid.arrivalDistance
    }
    
    var isDangerous: Bool {
        asteroid.isDangerous
    }
    
    private let asteroid: Asteroid
    
    init(asteroid: Asteroid) {
        self.asteroid = asteroid
    }
}
