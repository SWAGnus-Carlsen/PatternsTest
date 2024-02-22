//
//  CoordinatorProtocols.swift
//  PatternsTest
//
//  Created by Vitaliy Halai on 21.02.24.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController? { get }
    
    func startCoordinator()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
