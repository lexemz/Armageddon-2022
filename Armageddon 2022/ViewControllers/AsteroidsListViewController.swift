//
//  AsteroidsListViewController.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 27.05.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class AsteroidsListViewController: UICollectionViewController {
    init() {
        let layout = UICollectionViewLayout()
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Армагеддон 2022"
        collectionView.backgroundColor = .systemBackground

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        setupFilterButtion()
    }

    private func setupFilterButtion() {
        let filterImage = UIImage(systemName: "line.3.horizontal.decrease")
        let filterBarButton = UIBarButtonItem(
            image: filterImage,
            style: .plain,
            target: self,
            action: #selector(filterButtonTapped)
        )
        navigationItem.rightBarButtonItem = filterBarButton
    }

    @objc private func filterButtonTapped() {
        print(1)
    }
}

// MARK: - UICollectionViewDataSource

extension AsteroidsListViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell

        return cell
    }
}
