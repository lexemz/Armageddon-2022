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
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMM y"
        if let arrivalDate = asteroid.arrivalDate {
            return "Подлетает: \(dateFormatter.string(from: arrivalDate))"
        } else {
            return "Подлетает: неизвстно когда"
        }
    }

    var arrivalDistanceText: String {
        "на расстояние \(asteroid.arrivalDistance.kilometers) км"
    }

    var dangerStatusTextComponents: [String: String] {
        [
            "head": "Оценка: ",
            "status": isDangerous ? "опасен" : "не опасен",
        ]
    }

    private let asteroid: Asteroid
    private let indexPath: IndexPath
    private let deleagte: AsteroidCellViewModelDelegate

    init(asteroid: Asteroid,
         indexPath: IndexPath,
         delegate: AsteroidCellViewModelDelegate)
    {
        self.asteroid = asteroid
        self.indexPath = indexPath
        deleagte = delegate
    }

    func destroyButtonIsPressed() {
        deleagte.destroyButtonIsPressed(at: indexPath)
    }
}
