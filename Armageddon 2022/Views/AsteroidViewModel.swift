//
//  AsteroidViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation

protocol AsteroidViewModelType {
    var isDangerous: Bool { get }
    var diametr: Double { get }
    
    var name: String { get }
    var diametrText: String { get }
    var arrivalDateText: String { get }
    var arrivalDistanceText: String { get }
    var dangerStatusText: NSMutableAttributedString { get }
}

class AsteroidViewModel: AsteroidViewModelType {
    var isDangerous: Bool {
        asteroid.isDangerous
    }
    
    var diametr: Double {
        asteroid.diametr
    }
    
    var name: String {
        asteroid.name
    }
    
    var diametrText: String {
        "Диаметр: \(asteroid.diametr)м"
    }
    
    var arrivalDateText: String {
        "Подлетает: \(asteroid.arrivalDate)"
    }
    
    var arrivalDistanceText: String {
        "на расстояние \(asteroid.arrivalDistance) км"
    }
    
    var dangerStatusText: NSMutableAttributedString {
        NSMutableAttributedString(string: "\(asteroid.isDangerous)")
    }
    
    private let asteroid: Asteroid
    
    init(asteroid: Asteroid) {
        self.asteroid = asteroid
    }
}
