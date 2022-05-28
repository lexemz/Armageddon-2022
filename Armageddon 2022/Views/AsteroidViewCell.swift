//
//  AsteroidViewCell.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import UIKit
import SnapKit

class AsteroidViewCell: UICollectionViewCell {
    
    static let id = "asteroidCell"
    
    var viewModel: AsteroidViewModelType! {
        didSet {
            configure()
        }
    }
    
    private let asteroidContainerView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private func configure() {
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        asteroidContainerView.image = viewModel.isDangerous ? UIImage(named: "dangerousBackground") : UIImage(named: "safeBackground")
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.25
        layer.masksToBounds = false
    }
}

extension AsteroidViewCell {
    private func makeConstraints() {
        contentView.addSubview(asteroidContainerView)
        asteroidContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(contentView.frame.height * (1 - 0.5292))
        }
    }
}
