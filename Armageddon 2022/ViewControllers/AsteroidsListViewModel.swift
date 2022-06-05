//
//  AsteroidsListViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import UIKit

class AsteroidsListViewModel: AsteroidsListViewModelType {
    var measureUnit: MeasureUnit = .kilometers
    var dangeroudsOnly: Bool = false
    
    var asteroids: [Asteroid] = []
    
    func toggleDangerousOnly() {
        dangeroudsOnly.toggle()
        Log.d("Только опасные астероиы: \(dangeroudsOnly)")
    }
    
    func changeMeasureUnit(_ unit: MeasureUnit) {
        measureUnit = unit
        Log.d("Новая единица измерения: \(measureUnit)")
    }
    
    func fetchAsteroids(completion: @escaping () -> Void) {
        asteroids = Asteroid.generateMock()
    }
}

// MARK: - Data Source
extension AsteroidsListViewModel {
    func numberOfItems() -> Int {
        asteroids.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> AsteroidCellViewModelType {
        AsteroidCellViewModel(
            asteroid: asteroids[indexPath.row],
            indexPath: indexPath,
            delegate: self
        )
    }
}

extension AsteroidsListViewModel: AsteroidCellViewModelDelegate {
    func destroyButtonIsPressed(at indexPath: IndexPath) {
        Log.d("Destroy button is pressed -> \(indexPath)")
    }
}
