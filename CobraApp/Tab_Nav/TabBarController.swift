//
//  TabBarController.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 03.06.2023.
//

enum Tabs: Int,CaseIterable {
    case search
    case music
    case profile
}

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        tabBar()
        tabBarApperance()
        switchTo(tab: .search)
        
    }
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    func tabBar() {
        
        let moonNavController = NavBarController(rootViewController: MoonController())
        let musicNavController = NavBarController(rootViewController: MusicController())
        let profileNavController = NavBarController(rootViewController: ProfileController())
        
        viewControllers = [
            generateVC(viewController: moonNavController, title: "Search", image: R.Images.moon),
            generateVC(viewController: musicNavController, title: "Music", image: R.Images.music),
            generateVC(viewController: profileNavController, title: "Profile", image: R.Images.profile)
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
        
    }

    
    
    private func tabBarApperance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = R.Colors.bar
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = true
//
//
//        let positionOnX: CGFloat = 10
//        let positionOnY: CGFloat = 14
//
//        let width = tabBar.bounds.width - positionOnX * 2
//        let height = tabBar.bounds.height + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(
//            roundedRect: CGRect(
//                x: positionOnX,
//                y: tabBar.bounds.minY - positionOnY,
//                width: width, height: height),
//            cornerRadius: height/2)
//
//        roundLayer.path = bezierPath.cgPath
//
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//        tabBar.itemWidth = width / 4
//        tabBar.itemPositioning = .centered
    }
}
