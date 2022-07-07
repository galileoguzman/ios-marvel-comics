//
//  AppCoordinator.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import UIKit


class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()

    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }

    // MARK: - Overrides
    
    override func start() {
        // Set Navigation Controller Delegate
        navigationController.delegate = self
        
        // Show home
        showHome()
    }
    
    // MARK: -
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }

    // MARK: - Helper Methods
    
    private func showHome() {
        // Initialize comics view controller
        let comicsVC = ComicsListViewController.instantiate()
        let viewModel = ComicsListViewModel()
        
        // Configure comics view controller
        comicsVC.viewModel = viewModel
        
        // Install handlers
        comicsVC.didSelectComic = {[weak self] in
            // Self coordinator method
        }
        
        
        // Push comicsVC into navigation stack
        navigationController.pushViewController(comicsVC, animated: true)
    }
    
    
}
