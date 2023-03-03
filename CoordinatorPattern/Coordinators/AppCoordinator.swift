//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    
    let window: UIWindow
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController = UINavigationController()
    
    init (window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainFlowCoordinator = MainFlowCoordinator(navigationController: navigationController)
        self.window.rootViewController = mainFlowCoordinator.navigationController
        self.childCoordinators.append(mainFlowCoordinator)
        mainFlowCoordinator.parentCoordinator = self
        mainFlowCoordinator.start()
    }
    
    func childDidFinish(_ child: CoordinatorProtocol?) {
        if let index = childCoordinators.firstIndex(where: { $0 === child }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
