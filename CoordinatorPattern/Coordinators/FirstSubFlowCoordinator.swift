//
//  FirstSubFlowCoordinator.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

class FirstSubFlowCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    var childCoordinators = [CoordinatorProtocol]()
    
    weak var parentCoordinator: CoordinatorProtocol?
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let subFlow = MainSubFlowViewController()
        subFlow.modalPresentationStyle = .overCurrentContext
        subFlow.coordinator = self
        navigationController.present(subFlow, animated: true)
    }
    
    func finish() {
        navigationController.dismiss(animated: true, completion: nil)
        parentCoordinator?.childDidFinish(self)
    }
}
