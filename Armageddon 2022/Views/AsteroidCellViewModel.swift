//
//  AsteroidCellViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation
import UIKit

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
        let asteroidStatus = NSMutableAttributedString(string: "Оценка: ")
        
        if isDangerous {
            let status = NSMutableAttributedString(
                string: "опасен",
                attributes: [
                    .foregroundColor: Colors.asteroidDangateousStatusColor,
                    .font: UIFont(name: "Helvetica-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
                ]
            )
            asteroidStatus.append(status)
        } else {
            asteroidStatus.append(NSAttributedString(string: "не опасен"))
        }
        return asteroidStatus
    }
    
    private let asteroid: Asteroid
    private let indexPath: IndexPath
    private let deleagte: AsteroidCellViewModelDelegate
    
    init(asteroid: Asteroid,
         indexPath: IndexPath,
         delegate: AsteroidCellViewModelDelegate
    ) {
        self.asteroid = asteroid
        self.indexPath = indexPath
        self.deleagte = delegate
    }
    
    func destroyButtonIsPressed() {
        deleagte.destroyButtonIsPressed(at: indexPath)
    }
}
