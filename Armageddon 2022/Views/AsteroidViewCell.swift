//
//  AsteroidViewCell.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import UIKit

class AsteroidViewCell: UICollectionViewCell {
    
    static let id = "asteroidCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        contentView.layer.cornerRadius = 10
        layer.shadowColor = UIColor.tertiaryLabel.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
