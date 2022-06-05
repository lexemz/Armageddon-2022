//
//  AsteroidCellViewModelType.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 05.06.2022.
//

import Foundation

protocol AsteroidCellViewModelType {
    var isDangerous: Bool { get }
    var diametr: Double { get }
    
    var name: String { get }
    var diametrText: String { get }
    var arrivalDateText: String { get }
    var arrivalDistanceText: String { get }
    var dangerStatusTextComponents: [String: String] { get }
    
    func destroyButtonIsPressed()
}
