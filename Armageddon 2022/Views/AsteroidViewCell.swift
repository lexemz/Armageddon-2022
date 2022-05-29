//
//  AsteroidViewCell.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import SnapKit
import UIKit

class AsteroidViewCell: UICollectionViewCell {
    // MARK: - UI

    private let asteroidContainerView = UIImageView()
    
    private let asteroidNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        return label
    }()
    
    private let asteroidDiametrLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    private let asteroidArrivalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    private let asteroidDistanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    private lazy var asteroidInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            asteroidDiametrLabel,
            asteroidArrivalLabel,
            asteroidDistanceLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()
    
    private let dinoImage = UIImageView()
    private let asteroidImage = UIImageView()
    
    private let destroyButton: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        // FIXME: Изменить шрифт
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12)
        config.title = "УНИЧТОЖИТЬ"
        button.configuration = config
        return button
    }()
    
    private let dangerStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    static let id = "asteroidCell"
    
    var viewModel: AsteroidViewModelType! {
        didSet {
            configure()
        }
    }
    
    private func configure() {
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.25
        layer.masksToBounds = false
        
        asteroidContainerView.image = viewModel.isDangerous ?
        UIImage(named: "dangerousBackground") : UIImage(named: "safeBackground")
        
        dinoImage.image = viewModel.isDangerous ?
        UIImage(named: "dino_shocked") : UIImage(named: "dino")
        
        asteroidImage.image = UIImage(named: "asteroid")
        
        // FIXME: перенести подготовку сообещний во ViewModel
        asteroidNameLabel.text = viewModel.name
        asteroidDiametrLabel.text = "Диаметр: \(viewModel.diametr)м"
        asteroidArrivalLabel.text = "Подлетает: \(viewModel.arrivalDate)"
        asteroidDistanceLabel.text = "на расстояние \(viewModel.arrivalDistance) км"
        dangerStatusLabel.attributedText = viewModel.dangerStatusLabel
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
        
        asteroidContainerView.addSubview(asteroidNameLabel)
        asteroidNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(asteroidContainerView.snp.bottom).inset(8)
            make.leading.equalTo(asteroidContainerView.snp.leading).inset(16)
        }
        
        asteroidContainerView.addSubview(dinoImage)
        dinoImage.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(30)
            make.trailing.equalTo(asteroidContainerView.snp.trailing).inset(12)
            make.bottom.equalTo(asteroidContainerView.snp.bottom)
        }
        
        asteroidContainerView.addSubview(asteroidImage)
        asteroidImage.snp.makeConstraints { make in
            make.width.equalTo(asteroidImage.snp.height)
            make.bottom.equalTo(asteroidContainerView.snp.bottom).inset(61)
            make.leading.equalTo(asteroidContainerView.snp.leading).inset(27)
            make.height.equalTo(viewModel.diametr)
        }
        
        contentView.addSubview(asteroidInfoStackView)
        asteroidInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(asteroidContainerView.snp.bottom).inset(-16)
            make.leading.equalTo(contentView.snp.leading).inset(16)
        }
        
        contentView.addSubview(destroyButton)
        destroyButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
        }
        
        contentView.addSubview(dangerStatusLabel)
        dangerStatusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).inset(19)
            make.leading.equalTo(contentView.snp.leading).inset(16)
        }
    }
}
