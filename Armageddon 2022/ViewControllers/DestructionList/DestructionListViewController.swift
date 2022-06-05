//
//  DestructionListViewController.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 05.06.2022.
//

import UIKit

class DestructionListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
        navigationItem.title = "Список на уничтожение"
    }
}
