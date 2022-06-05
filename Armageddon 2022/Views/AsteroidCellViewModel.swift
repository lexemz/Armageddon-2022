//
//  AsteroidCellViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation

class AsteroidCellViewModel: AsteroidCellViewModelType {
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
    private let indexPath: IndexPath
    
    init(asteroid: Asteroid,
         indexPath: IndexPath
    ) {
        self.asteroid = asteroid
        self.indexPath = indexPath
    }
    
    func destroyButtonIsPressed() {
        Log.d("Destroy button is pressed - \(indexPath)")
    }
}
