//
//  AsteroidCellViewModelDelegate.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 05.06.2022.
//

import Foundation

protocol AsteroidCellViewModelDelegate {
    func destroyButtonIsPressed(at indexPath: IndexPath)
}
