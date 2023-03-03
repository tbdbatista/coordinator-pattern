//
//  MainFlowCoordinator.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class MainFlowCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators = [CoordinatorProtocol]()
    
    weak var parentCoordinator: CoordinatorProtocol?

    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        
        setupNavigationController(to: homeViewController, titleColor: .green, tintColor: .blue)
        self.navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func setupNavigationController(to viewController: UIViewController, title: String = "", titleColor: UIColor = .cyan, tintColor: UIColor = .systemBlue) {
        self.navigationController.navigationBar.barTintColor = titleColor
        self.navigationController.navigationBar.tintColor = tintColor
        viewController.navigationItem.title = title
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

    func goToSecondVC() {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        setupNavigationController(to: secondViewController, title: "Second View Controller")
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func goToThirdVC() {
        let thirdViewController = ThirdViewController()
        thirdViewController.coordinator = self
        setupNavigationController(to: thirdViewController, title: "Third View Controller")
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func goToSubFlowCoordinator() {
        let firstSubFlowCoordinator = FirstSubFlowCoordinator(navigationController: navigationController)
        firstSubFlowCoordinator.parentCoordinator = self
        childCoordinators.append(firstSubFlowCoordinator)
        firstSubFlowCoordinator.start()
    }
    
}
