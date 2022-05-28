//
//  AsteroidsListViewController.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 27.05.2022.
//

import UIKit

class AsteroidsListViewController: UICollectionViewController {
    private var filterMenuButton: UIBarButtonItem!
    
    private var viewModel: AsteroidsListViewModelType = AsteroidsListViewModel()

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Армагеддон 2022"

        setupCollectionView()
        setupFilterButtion()
        
        viewModel.fetchAsteroids { [weak self] in
            guard let unretainedSelf = self else { return }
            unretainedSelf.collectionView.reloadData()
        }
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
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground

        collectionView.register(
            AsteroidViewCell.self,
            forCellWithReuseIdentifier: AsteroidViewCell.id
        )
        collectionView.alwaysBounceVertical = true
    }

    private func generateFilterPullDownMenu() -> UIMenu {
        let dangerImage = UIImage(systemName: "exclamationmark.triangle")?.withRenderingMode(.alwaysOriginal)
        
        let dangerAsteroids = UIAction(
            title: "Только опасные",
            image: dangerImage?.withTintColor(.systemRed),
            state: viewModel.dangeroudsOnly ? .on : .off,
            handler: { _ in
                self.viewModel.toggleDangerousOnly()
                self.filterMenuButton.menu = self.generateFilterPullDownMenu()
            }
        )
        
        let unitsOfMeasurementMenu = UIMenu(
            title: "Едицы измерения расстояний",
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

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate

extension AsteroidsListViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AsteroidViewCell.id,
            for: indexPath
        ) as! AsteroidViewCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}

extension AsteroidsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width - 32, height: 308)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        25
    }
}
