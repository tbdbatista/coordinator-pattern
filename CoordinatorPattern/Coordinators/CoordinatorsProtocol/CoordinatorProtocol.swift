//
//  CoordinatorProtocol.swift
//  CoordinatorPattern
//
//  Created by Beltrami Dias Batista, Thiago on 26/02/23.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] {get set}
    var navigationController: UINavigationController {get set}
    func start()
    func childDidFinish(_ child: CoordinatorProtocol?)
}

extension CoordinatorProtocol {
    func childDidFinish(_ child: CoordinatorProtocol?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
