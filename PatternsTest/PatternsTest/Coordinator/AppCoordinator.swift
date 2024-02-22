//
//  AppCoordinator.swift
//  PatternsTest
//
//  Created by Vitaliy Halai on 21.02.24.
//

import UIKit

enum AppCoordinatorEvent {
    case showSecondVC
    case showAnotherModuleVC
    case presentingButtonTapped

}

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?  = UINavigationController()
    var childCoordinators: [Coordinator] = []
    
    func eventOccured(_ event: AppCoordinatorEvent) {
        switch event {
        case .showSecondVC:
            showSecondVC()
        case .presentingButtonTapped:
            presentSecondVC(from: navigationController?.viewControllers.last ?? UIViewController())
        case .showAnotherModuleVC:
            showAnotherModuleVC()
        }
    }
    
    func startCoordinator() {
        let initialController = ViewController()
        initialController.coordinator = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(initialController, animated: false)
        childCoordinators.append(ChildCoordinator(childCoordinators: [], navigationController: navigationController))
    }
    
    //MARK: Private funcs
    private func showSecondVC() {
        var secondVC: UIViewController & Coordinating = SecondViewController()
        secondVC.coordinator = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func presentSecondVC(from presentingVC: UIViewController) {
        var secondVC: UIViewController & Coordinating = SecondViewController()
        secondVC.coordinator = self
        presentingVC.present(secondVC, animated: true)
    }
    
    private func showAnotherModuleVC() {
        var vc: UIViewController & Coordinating = FromAnotherModuleVC()
        vc.coordinator = childCoordinators.first(where: {$0 is ChildCoordinator})
        navigationController?.pushViewController(vc, animated: true)
    }
}


