//
//  AsteroidsListViewModelType.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 05.06.2022.
//

import Foundation

protocol AsteroidsListViewModelType {
    var dangeroudsOnly: Bool { get }
    var measureUnit: MeasureUnit { get }
    
    func toggleDangerousOnly()
    func changeMeasureUnit(_ unit: MeasureUnit)
    func fetchAsteroids(completion: @escaping () -> Void)
    
    // Data Source
    func numberOfItems() -> Int
    func cellViewModel(at indexPath: IndexPath) -> AsteroidCellViewModelType
}
