//
//  MainTabBarController.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 27.05.2022.
//

import UIKit

class MainMabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let flowLayout = UICollectionViewLayout()
        let asteroidsListVC = makeTabBarItem(
            viewController: AsteroidsListViewController(
                collectionViewLayout: flowLayout
            ),
            itemTitle: "Астероиды",
            unselectedImageName: "globe",
            selectedImageName: "globe"
        )
        
        /*
        DestructionListViewController
        let destructionListVC = makeTabBarItem(
            viewController: ,
            itemTitle: "Уничтожение",
            unselectedImageName: "trash",
            selectedImageName: "trash.fill"
        )
        */
        
        viewControllers = [asteroidsListVC]
    }
    
    private func makeTabBarItem(
        viewController: UIViewController,
        itemTitle: String,
        unselectedImageName: String,
        selectedImageName: String
    ) -> UINavigationController {
        let item = UITabBarItem(
            title: itemTitle,
            image: UIImage(systemName: unselectedImageName),
            selectedImage: UIImage(systemName: selectedImageName)
        )
        let navigationControllerWrapper = UINavigationController(rootViewController: viewController)
        navigationControllerWrapper.tabBarItem = item
        return navigationControllerWrapper
    }
}
