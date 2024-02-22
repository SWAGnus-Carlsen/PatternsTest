//
//  ChildCoordinator.swift
//  PatternsTest
//
//  Created by Vitaliy Halai on 22.02.24.
//

import UIKit

enum ChildCoordinatorEvent {
    case showNewScreen
}

class ChildCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    func startCoordinator() { }
    
   
    
    init(childCoordinators: [Coordinator], navigationController: UINavigationController? = nil) {
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
    }
    
    func eventOccured(_ event: ChildCoordinatorEvent) {
        switch event {
        case .showNewScreen:
            showLastVC()
        }
    }
    
    private func showLastVC() {
        var vc: UIViewController = OneMoreVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
