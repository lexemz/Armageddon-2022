//
//  AsteroidsListViewModel.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import UIKit

protocol AsteroidsListViewModelType {
    var dangeroudsOnly: Bool { get }
    var measureUnit: MeasureUnit { get }
    
    func toggleDangerousOnly()
    func changeMeasureUnit(_ unit: MeasureUnit)
}

class AsteroidsListViewModel: AsteroidsListViewModelType {
    var measureUnit: MeasureUnit = .kilometers
    var dangeroudsOnly: Bool = false
    
    func toggleDangerousOnly() {
        dangeroudsOnly.toggle()
        Log.d("Только опасные астероиы: \(dangeroudsOnly)")
    }
    
    func changeMeasureUnit(_ unit: MeasureUnit) {
        measureUnit = unit
        Log.d("Новая единица измерения: \(measureUnit)")
    }
}

enum MeasureUnit {
    case kilometers
    case lunarOrbits
}
