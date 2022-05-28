//
//  AsteroidsListViewController.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 27.05.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class AsteroidsListViewController: UICollectionViewController {
    private var filterMenuButton: UIBarButtonItem!
    
    private var viewModel: AsteroidsListViewModelType = AsteroidsListViewModel()

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
        filterMenuButton = UIBarButtonItem(
            title: "",
            image: filterImage,
            primaryAction: nil,
            menu: generateFilterPullDownMenu()
        )
        navigationItem.rightBarButtonItem = filterMenuButton
    }

    private func generateFilterPullDownMenu() -> UIMenu {
        let dangerAsteroids = UIAction(
            title: "Только опасные",
            image: UIImage(systemName: "flame"),
            state: viewModel.dangeroudsOnly ? .on : .off,
            handler: { _ in
                self.viewModel.toggleDangerousOnly()
                self.filterMenuButton.menu = self.generateFilterPullDownMenu()
            }
        )
        let unitsOfMeasurementMenu = UIMenu(
            title: "Ед. изм. расстояний",
            image: UIImage(systemName: "lines.measurement.horizontal"),
            children: [
                UIAction(
                    title: "Киломерты",
                    state: viewModel.measureUnit == .kilometers ? .on : .off,
                    handler: { _ in
                        self.viewModel.changeMeasureUnit(.kilometers)
                        self.filterMenuButton.menu = self.generateFilterPullDownMenu()
                    }
                ),
                UIAction(
                    title: "Лунные орбиты",
                    state: viewModel.measureUnit == .lunarOrbits ? .on : .off,
                    handler: { _ in
                        self.viewModel.changeMeasureUnit(.lunarOrbits)
                        self.filterMenuButton.menu = self.generateFilterPullDownMenu()
                    }
                )
            ]
        )

        let menuItems = [dangerAsteroids, unitsOfMeasurementMenu]
        return UIMenu(title: "Параметры", children: menuItems)
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
