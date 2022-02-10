//
//  TabBarController.swift
//  ViewLifecycle
//
//  Created by Саидов Тимур on 10.02.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum TabBarItem {
        case feed
        case profile
        
        var title: String {
            switch self {
            case .feed:
                return "Лента"
            case .profile:
                return "Профиль"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .feed:
                return UIImage(systemName: "house")
            case .profile:
                return UIImage(systemName: "person.circle")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    private func setupTabBar() {
        let items: [TabBarItem] = [.feed, .profile]
        
        self.viewControllers = items.map({ tabBarIten in
            switch tabBarIten {
            case .feed:
                return UINavigationController(rootViewController: ViewController())
            case .profile:
                return SecondViewController()
            }
        })
        self.viewControllers?.enumerated().forEach({ (index, vc) in
            vc.tabBarItem.title = items[index].title
            vc.tabBarItem.image = items[index].image
        })
    }
}
