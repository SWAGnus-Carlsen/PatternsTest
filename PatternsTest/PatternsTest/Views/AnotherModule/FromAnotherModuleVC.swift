//
//  FromAnotherModuleVC.swift
//  PatternsTest
//
//  Created by Vitaliy Halai on 22.02.24.
//

import UIKit

class FromAnotherModuleVC: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Another Module"
        
        setupButton(withYOffset: 20, title: "Navigate", selector: #selector(didTapButton))
    }
    
    private func setupButton(withYOffset offset: CGFloat, title: String, selector: Selector) {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.frame.origin.y += offset
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: selector , for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func didTapButton() {
        guard let childCoordinator = coordinator as? ChildCoordinator else { return }
        childCoordinator.eventOccured(.showNewScreen)
    }
    

    

}
