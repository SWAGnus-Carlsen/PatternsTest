//
//  SecondViewController.swift
//  PatternsTest
//
//  Created by Vitaliy Halai on 21.02.24.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .systemCyan
        title = "Second"
        
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
        guard let appCoordinator = coordinator as? AppCoordinator else { return }
        appCoordinator.eventOccured(.showAnotherModuleVC)
    }
}
