//
//  CustomTabBarController.swift
//  CustomTabBarControllerProgrammaticly
//
//  Created by Elif Korkmaz on 30.06.2021.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let tabBarItem1 = UINavigationController(rootViewController: HomeViewController())
    let tabBarItem2 = UINavigationController(rootViewController: ProfileViewController(parameter: "Example"))
    let tabBarItem3 = UINavigationController(rootViewController: SearchViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
        configureTabBarItems()
    }
    
    func configureTabBarItems() {
        tabBarItem1.title = "Home"
        tabBarItem2.title = "Profile"
        tabBarItem3.title = "Search"
        
        setViewControllers([tabBarItem1,tabBarItem2,tabBarItem3], animated: false)
        
        guard let items = tabBar.items else { return }
        
        let images = ["house", "person.circle", "magnifyingglass"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
    }

}


//MARK: Example classes as Tab Bar Items

class HomeViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Go to ExampleVC", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        view.addSubview(button)
        button.addTarget(self, action: #selector(navigateToExampleVC1), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
   @objc func navigateToExampleVC1() {
        navigationController?.pushViewController(ExampleVC(), animated: true)
    }
}

class ProfileViewController: UIViewController {
    
    private let parameter: String
    
    init(parameter: String) {
        self.parameter = parameter
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Profile"
        print(parameter)
    }
}

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Search"
    }
}

//MARK: Example class to test navigation controller

class ExampleVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ExampleVC1"
    }
}
