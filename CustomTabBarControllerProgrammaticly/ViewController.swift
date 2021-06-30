//
//  ViewController.swift
//  CustomTabBarControllerProgrammaticly
//
//  Created by Elif Korkmaz on 30.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var customTabBarController: CustomTabBarController!

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton() {
        
        customTabBarController = CustomTabBarController()

        present(customTabBarController, animated: true)
    }
}
